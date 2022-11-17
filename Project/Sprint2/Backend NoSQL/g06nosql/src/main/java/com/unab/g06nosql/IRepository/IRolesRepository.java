package com.unab.g06nosql.IRepository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.unab.g06nosql.Collection.Roles;

public interface IRolesRepository extends MongoRepository<Roles, String> {

}
