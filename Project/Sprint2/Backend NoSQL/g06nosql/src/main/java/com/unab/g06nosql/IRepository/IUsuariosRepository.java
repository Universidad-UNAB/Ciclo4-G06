package com.unab.g06nosql.IRepository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.unab.g06nosql.Collection.Usuarios;

public interface IUsuariosRepository extends MongoRepository<Usuarios, String> {

}
