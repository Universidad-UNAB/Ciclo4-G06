package com.unab.g06sql.IRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.unab.g06sql.Entity.Usuarios;

public interface IUsuariosRepository extends JpaRepository<Usuarios, Integer> {

}
