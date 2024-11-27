package com.eyewear.services.impl;

import com.eyewear.entities.Order;
import com.eyewear.entities.OrderDetail;
import com.eyewear.repositories.OrderRepository;
import com.eyewear.repositories.BranchRepository;
import com.eyewear.repositories.ProductRepository;
import com.eyewear.services.RevenueService;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class RevenueServiceImpl implements RevenueService {
   
   @Autowired
   private OrderRepository orderRepository;
   
   @Autowired
   private BranchRepository branchRepository;
   
   @Autowired
   private ProductRepository productRepository;

   @Override
   public Map<String, Object> getRevenueData(Long branchId, Long productId, 
           LocalDateTime startDate, LocalDateTime endDate) {
       Map<String, Object> result = new HashMap<>();
       List<Order> orders = orderRepository.findOrdersForReport(branchId, productId, startDate, endDate);
       
       result.put("chartData", processChartData(orders));
       result.put("totalRevenue", calculateTotalRevenue(orders));
       
       if (productId != null) {
           result.put("productStatistics", calculateProductStatistics(orders, productId));
       }
       
       if (branchId != null) {
           result.put("branchStatistics", calculateBranchStatistics(orders, branchId));
       }
       
       return result;
   }

   @Override
   public void writeReportToStream(Long branchId, Long productId,
           LocalDateTime startDate, LocalDateTime endDate,
           String fileType, OutputStream outputStream) throws IOException {
       
       Map<String, Object> data = getRevenueData(branchId, productId, startDate, endDate);
       
       try {
           if ("excel".equalsIgnoreCase(fileType)) {
               writeExcelReport(data, outputStream);
           } else {
               writePdfReport(data, outputStream);
           }
       } catch (DocumentException e) {
           throw new IOException("Error generating report", e);
       }
   }
   
   private void writeExcelReport(Map<String, Object> data, OutputStream outputStream) 
           throws IOException {
       try (Workbook workbook = new XSSFWorkbook()) {
           Sheet sheet = workbook.createSheet("Báo cáo doanh thu");
           
           // Style cho header
           CellStyle headerStyle = workbook.createCellStyle();
           Font headerFont = workbook.createFont();
           headerFont.setBold(true);
           headerStyle.setFont(headerFont);
           
           // Tạo header
           Row headerRow = sheet.createRow(0);
           createCell(headerRow, 0, "Ngày", headerStyle);
           createCell(headerRow, 1, "Doanh thu", headerStyle);
           
           // Thêm dữ liệu
           @SuppressWarnings("unchecked")
           List<Map<String, Object>> chartData = (List<Map<String, Object>>) data.get("chartData");
           int rowNum = 1;
           for (Map<String, Object> item : chartData) {
               Row row = sheet.createRow(rowNum++);
               row.createCell(0).setCellValue(item.get("date").toString());
               row.createCell(1).setCellValue((Double) item.get("revenue"));
           }
           
           // Tự động điều chỉnh cột
           for (int i = 0; i < 2; i++) {
               sheet.autoSizeColumn(i);
           }
           
           workbook.write(outputStream);
       }
   }
   
   private void writePdfReport(Map<String, Object> data, OutputStream outputStream) 
           throws DocumentException {
       Document document = new Document();
       PdfWriter.getInstance(document, outputStream);
       document.open();
       
       document.add(new Paragraph("BÁO CÁO DOANH THU"));
       document.add(new Paragraph("Tổng doanh thu: " + 
           formatCurrency((Double) data.get("totalRevenue"))));
       
       PdfPTable table = new PdfPTable(2);
       table.setWidthPercentage(100);
       
       // Header
       table.addCell("Ngày");
       table.addCell("Doanh thu");
       
       // Data
       @SuppressWarnings("unchecked")
       List<Map<String, Object>> chartData = (List<Map<String, Object>>) data.get("chartData");
       for (Map<String, Object> item : chartData) {
           table.addCell(item.get("date").toString());
           table.addCell(formatCurrency((Double) item.get("revenue")));
       }
       
       document.add(table);
       document.close();
   }
   
   private String formatCurrency(Double amount) {
       return String.format("%,.0f VNĐ", amount);
   }
   
   private void createCell(Row row, int column, String value, CellStyle style) {
       Cell cell = row.createCell(column);
       cell.setCellValue(value);
       cell.setCellStyle(style);
   }

   private List<Map<String, Object>> processChartData(List<Order> orders) {
       return orders.stream()
           .collect(Collectors.groupingBy(
               order -> order.getOrderAt().toLocalDate(),
               TreeMap::new,
               Collectors.summingDouble(Order::getTotalPrice)))
           .entrySet().stream()
           .map(entry -> {
               Map<String, Object> point = new HashMap<>();
               point.put("date", entry.getKey().toString());
               point.put("revenue", entry.getValue());
               return point;
           })
           .collect(Collectors.toList());
   }

   private Map<String, Object> calculateProductStatistics(List<Order> orders, Long productId) {
       Map<String, Object> stats = new HashMap<>();
       
       double totalRevenue = orders.stream()
           .flatMap(order -> order.getItems().stream())
           .filter(item -> item.getProduct().getId().equals(productId))
           .mapToDouble(item -> item.getQuantity() * item.getPrice())
           .sum();
           
       long totalQuantity = orders.stream()
           .flatMap(order -> order.getItems().stream())
           .filter(item -> item.getProduct().getId().equals(productId))
           .mapToLong(OrderDetail::getQuantity)
           .sum();
       
       stats.put("totalRevenue", totalRevenue);
       stats.put("totalQuantity", totalQuantity);
       return stats;
   }

   private Map<String, Object> calculateBranchStatistics(List<Order> orders, Long branchId) {
       Map<String, Object> stats = new HashMap<>();
       stats.put("totalRevenue", calculateTotalRevenue(orders));
       stats.put("orderCount", orders.size());
       return stats;
   }
   
   private double calculateTotalRevenue(List<Order> orders) {
       return orders.stream()
           .mapToDouble(Order::getTotalPrice)
           .sum();
   }
}