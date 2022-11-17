package com.unab.g06nosql.IRepository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.unab.g06nosql.Collection.Personas;

public interface IPersonasRepository extends MongoRepository<Personas, String>{

}
