package com.eyewear.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.eyewear.entities.ProductReview;


public interface ProductReviewService {
	void delete(ProductReview entity);

	void deleteById(Long id);

	long count();

	<S extends ProductReview> Optional<S> findOne(Example<S> example);

	Optional<ProductReview> findById(Long id);

	//List<ProductReview> findAllById(Iterable<Long> ids);

	//List<ProductReview> findAll(Sort sort);

	Page<ProductReview> findAll(Pageable pageable);

	List<ProductReview> findAll();

	//<S extends ProductReview> S save(S entity);

	//Page<ProductReview> findByCategoryNameContaining(String name, Pageable pageable);

	//List<ProductReview> findByCategoryNameContaining(String name);
}
