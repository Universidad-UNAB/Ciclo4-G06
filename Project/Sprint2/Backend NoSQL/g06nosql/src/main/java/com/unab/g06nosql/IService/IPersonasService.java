package com.unab.g06nosql.IService;
import java.util.List;
import java.util.Optional;

import com.unab.g06nosql.Collection.Personas;



public interface IPersonasService {
	
	public List<Personas> all();

	public Optional<Personas> findById(String id);

	public Personas save(Personas personas);

	public void delete(String id);

}
