package com.eyewear.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "branches")
public class Branch {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private String name;	
	
	@OneToOne
    @JoinColumn(name = "address_id", nullable = true)
	private Address address;
	
	@OneToMany(mappedBy = "branch", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<BranchProduct> products;

	@OneToMany(mappedBy = "branch", cascade = CascadeType.ALL)
    private List<Appointment> appointments;
}