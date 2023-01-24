package com.alibou.security.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.alibou.security.entity.Organization;

public interface OrganizationRepository extends JpaRepository<Organization, Long> {

}
