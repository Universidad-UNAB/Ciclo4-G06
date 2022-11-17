package com.unab.g06sql.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unab.g06sql.Entity.Usuarios;
import com.unab.g06sql.IRepository.IUsuariosRepository;
import com.unab.g06sql.IService.IUsuariosService;

@Service
public class UsuariosService implements IUsuariosService{

	@Autowired
	private IUsuariosRepository repository;

	@Override
	public List<Usuarios> all() {	
		return repository.findAll();
	}

	@Override
	public Optional<Usuarios> findById(Integer id) {		
		return repository.findById(id);
	}

	@Override
	public Usuarios save(Usuarios usuarios) {		
		return repository.save(usuarios);
	}

	@Override
	public void delete(Integer id) {
		repository.deleteById(id);	
	}
}
