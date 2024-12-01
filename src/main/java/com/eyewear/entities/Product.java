package com.eyewear.entities;

import java.util.List;
import java.util.stream.Collectors;

import jakarta.persistence.*;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Inheritance(strategy = InheritanceType.JOINED) // Kế thừa
@DiscriminatorColumn(name = "product_type", discriminatorType = DiscriminatorType.STRING)  // Cột phân biệt loại sản phẩm
@Table(name = "products", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(length=100, nullable = false)
	private String name;
	
	@Column(nullable = false)
	private double price;
	
	private String description;
	
	private String brand;
		
	private String image; // đường dẫn đến Cloudinary
	
	@Column(nullable=true)
	private Float height;
	
	@Column(nullable = true)
	private Float width;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ProductColor> colors; // Lưu màu sắc của sản phẩm
	
	//không cần lưu trữ vào cơ sở dữ liệu
	@Transient
    private String imageUrl; // URL to be generated
	
	 // Phương thức tính toán hình ảnh của sản phẩm khi màu sắc thay đổi
    public String getImageUrlForColor(String color) {
        for (ProductColor productColor : colors) {
            if (productColor.getColor().equalsIgnoreCase(color)) {
                return productColor.getImageUrl();  // Nếu màu sắc có hình ảnh riêng biệt
            }
        }
        return this.image;  // Nếu không, trả về hình ảnh chung của sản phẩm
    }

	@ManyToOne
	@JoinColumn(name = "category_id")  //khóa ngoại "category_id"
    private Category category;
	
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BranchProduct> branches;
	
	@Transient
	public List<BranchProduct> getAvailBranches() {
		return branches.stream()
                .filter(branchProduct -> branchProduct.getQuantity() > 0)
                .collect(Collectors.toList());
	}
	
}

