
package com.eyewear.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "addresses")
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String province;
	
	private String district;
	
	private String commue;
	
	private String streetName;
	
	private int streetNumber;

	
	@ManyToOne
    @JoinColumn(name = "buyer_id", nullable = false) // Khóa ngoại liên kết đến bảng Buyer
    private Buyer buyer;
}
