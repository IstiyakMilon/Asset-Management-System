package com.alibou.security.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;

public interface BaseController<Entity, ID> {

   @PostMapping(value = "save")
   ResponseEntity<Entity> save(Entity entity);

   @PatchMapping(value = "update", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
   ResponseEntity<String> update(Entity entity) throws Exception;

   @DeleteMapping(value = "delete/{ids}")
   ResponseEntity<?> deleteByIds(ID... ids);

   @GetMapping(value = "list/{ids}")
   ResponseEntity<List<Entity>> getDataByIds(ID... ids);

   @GetMapping(value = "list")
   List<Entity> getData();

}
