package com.alibou.security.serviceImplimentation;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.alibou.security.entity.Organization;
import com.alibou.security.repository.OrganizationRepository;
import com.alibou.security.service.OrganizationService;
import java.awt.dnd.InvalidDnDOperationException;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrganizationServiceImp implements OrganizationService {

   private final OrganizationRepository organizationRep;

   @Override
   public Organization save(Organization entity) {
      return organizationRep.save(entity);
   }

   @Override
   public Organization update(Organization organization) throws Exception {
      if (organization.hasId()) {
         return save(organization);
      } else {
         throw new InvalidDnDOperationException("Product id has been required for update operation");
      }
   }

   @Override
   public void deleteByIds(Long... ids) {
      organizationRep.deleteAllById(Arrays.asList(ids));

   }

   @Override
   public List<Organization> getDataByIds(Long... ids) {
      return organizationRep.findAllById(Arrays.asList(ids));
   }

   @Override
   public List<Organization> getData() {
      return organizationRep.findAll();
   }

}
