package com.unab.g06sql.IRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.unab.g06sql.Entity.Roles;

public interface IRolesRepository extends JpaRepository<Roles, Integer> {

}
