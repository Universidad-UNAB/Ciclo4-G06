package com.unab.g06sql.IRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.unab.g06sql.Entity.Personas;

public interface IPersonasRepository extends JpaRepository<Personas, Integer>{

}
