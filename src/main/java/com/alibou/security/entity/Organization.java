package com.alibou.security.entity;

import io.micrometer.common.lang.NonNull;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@Builder
public class Organization extends BaseEntity {

   private String organizationOid;
   @NonNull
   @Column(length = 256)
   private String organizationName;
   @Column(length = 256)
   private String organizationShortName;
   private String organizationAddress;
   @Column(length = 512)
   private String organizationUrl;
   private String organizationDataJson;
   @Column(length = 32)
   private String organizationStatus;
   private String organizationLogoFileFath;
   @Column(length = 128)
   private String createdBy;
   @Column(length = 128)
   private String updatedBy;

}
