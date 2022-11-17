package com.unab.g06nosql.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unab.g06nosql.Collection.Roles;
import com.unab.g06nosql.IRepository.IRolesRepository;
import com.unab.g06nosql.IService.IRolesService;


@Service
public class RolesService implements IRolesService{

	@Autowired
	private IRolesRepository repository;

	@Override
	public List<Roles> all() {	
		return repository.findAll();
	}

	@Override
	public Optional<Roles> findById(String id) {		
		return repository.findById(id);
	}

	@Override
	public Roles save(Roles roles) {		
		return repository.save(roles);
	}

	@Override
	public void delete(String id) {
		repository.deleteById(id);	
	}	
}
