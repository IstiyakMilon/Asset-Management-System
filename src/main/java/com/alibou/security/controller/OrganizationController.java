package com.alibou.security.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibou.security.entity.Organization;
import com.alibou.security.service.OrganizationService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/organizationController")
@RequiredArgsConstructor
public class OrganizationController implements BaseController<Organization, Long> {

   private final OrganizationService organizationService;

   @Override
   public ResponseEntity<Organization> save(Organization organization) {
      organizationService.save(organization);
      return ResponseEntity.ok(organization);
   }

   @Override
   public ResponseEntity<String> update(@RequestBody Organization organization) {
      try {
         organizationService.update(organization);
         return ResponseEntity.ok("Successfully organization information has been updated");
      } catch (Exception e) {
         return ResponseEntity.unprocessableEntity().body(e.getMessage());
      }
   }

   @Override
   public ResponseEntity<?> deleteByIds(Long... ids) {
      organizationService.deleteByIds(ids);
      return ResponseEntity.ok(null);
   }

   @Override
   public ResponseEntity<List<Organization>> getDataByIds(Long... ids) {
      return ResponseEntity.ok(organizationService.getDataByIds(ids));
   }

   @Override
   public List<Organization> getData() {
      return organizationService.getData();
   }

}
