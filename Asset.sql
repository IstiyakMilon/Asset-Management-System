CREATE TABLE public.organization (
	organization_oid varchar(128) NOT NULL,
	organization_name varchar(256) NOT NULL,
	organization_short_name varchar(256) NULL,
	organization_address text NULL,
	organization_url varchar(512) NULL,
	organization_data_json text NULL DEFAULT '{}'::text,
	organization_status varchar(32) NULL,
	organization_logo_file_path varchar NULL DEFAULT '{}'::character varying,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_organization PRIMARY KEY (organization_oid)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE public.department (
	department_oid varchar(128) NOT NULL,
	department_name varchar(256) NOT NULL,
	department_address text NULL,
	department_email varchar(256) NULL,
	department_url varchar(512) NULL,
	organization_oid varchar(128) NOT NULL,
	department_status varchar(32) NOT NULL DEFAULT '{}'::character varying,
	department_logo_file_path varchar(512) NULL,
	department_data_json text NOT NULL,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_department PRIMARY KEY (department_oid),
	CONSTRAINT fk_organization_oid_department FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE public.manufacturer (
	manufacturer_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	manufacturer_name varchar(256) NOT NULL,
	manufacturer_address text NULL,
	manufacturer_url varchar(512) NULL,
	manufacturer_json text NOT NULL DEFAULT '{}'::text,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_manufacturer PRIMARY KEY (manufacturer_oid),
	CONSTRAINT fk_organization_oid_manufacturer FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);



CREATE TABLE public.vendor (
	vendor_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	vendor_name varchar(256) NOT NULL,
	vendor_address text NULL,
	vendor_url varchar(512) NULL,
	vendor_json text NOT NULL DEFAULT '{}'::text,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_vendor PRIMARY KEY (vendor_oid),
	CONSTRAINT fk_organization_oid_vendor FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);


CREATE TABLE public.site (
	site_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	department_oid varchar(128) NOT NULL,
	site_code varchar(128) NULL,
	site_name varchar(256) NOT NULL,
	site_address text NULL,
	site_url varchar(512) NULL,
	site_status text NOT NULL,
	site_json varchar NULL DEFAULT '{}'::character varying,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT ck_site_status_site CHECK (((site_status = 'Active'::text) OR (site_status = 'Inactive'::text))),
	CONSTRAINT pk_site PRIMARY KEY (site_oid),
	CONSTRAINT fk_department_oid_site FOREIGN KEY (department_oid) REFERENCES public.department(department_oid),
	CONSTRAINT fk_organization_oid_site FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE public.sub_site (
	sub_site_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	department_oid varchar(128) NOT NULL,
	site_oid varchar(128) NOT NULL,
	sub_site_name varchar(256) NOT NULL,
	sub_site_address text NULL,
	sub_site_url varchar(512) NULL,
	sub_site_status text NOT NULL,
	sub_site_json varchar(32) NULL DEFAULT '{}'::character varying,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT ck_sub_site_status_sub_site CHECK (((sub_site_status = 'Active'::text) OR (sub_site_status = 'Inactive'::text))),
	CONSTRAINT pk_sub_site PRIMARY KEY (sub_site_oid),
	CONSTRAINT fk_department_oid_sub_site FOREIGN KEY (department_oid) REFERENCES public.department(department_oid),
	CONSTRAINT fk_organization_oid_sub_site FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid),
	CONSTRAINT fk_site_oid_sub_site FOREIGN KEY (site_oid) REFERENCES public.site(site_oid)
)
WITH (
	OIDS=FALSE
);


CREATE TABLE public.asset_category_type (
	asset_category_type_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	asset_category_type_name varchar(256) NOT NULL,
	created_by varchar(128) NOT NULL,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL DEFAULT 'System'::character varying,
	updated_on timestamp NULL,
	CONSTRAINT pk_asset_category_type PRIMARY KEY (asset_category_type_oid),
	CONSTRAINT fk_organization_oid_asset_category_type FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);


CREATE TABLE public.asset_category (
	asset_category_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	asset_category_name varchar(256) NOT NULL,
	asset_category_specification_json text NULL,
	asset_category_type_oid varchar(128) NULL,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_asset_category PRIMARY KEY (asset_category_oid),
	CONSTRAINT fk_asset_category_type_oid_asset_category FOREIGN KEY (asset_category_type_oid) REFERENCES public.asset_category_type(asset_category_type_oid),
	CONSTRAINT fk_organization_oid_asset_category FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE public.asset_sub_category (
	asset_sub_category_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	asset_category_oid varchar(128) NOT NULL,
	subcategory_name varchar(256) NOT NULL,
	asset_sub_category_specification_json text NULL,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_asset_sub_category PRIMARY KEY (asset_sub_category_oid),
	CONSTRAINT fk_asset_category_oid_asset_sub_category FOREIGN KEY (asset_category_oid) REFERENCES public.asset_category(asset_category_oid),
	CONSTRAINT fk_organization_oid_asset_sub_category FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);



CREATE TABLE public.asset_document (
	asset_document_oid varchar(128) NOT NULL,
	asset_oid varchar(128) NOT NULL,
	asset_document_tag text NOT NULL,
	asset_document_value text NOT NULL,
	asset_document_type varchar(32) NULL,
	asset_document_status varchar(32) NOT NULL,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT ck_asset_document_status_asset_document CHECK ((((asset_document_status)::text = 'Active'::text) OR ((asset_document_status)::text = 'Inactive'::text))),
	CONSTRAINT pk_asset_document PRIMARY KEY (asset_document_oid),
	CONSTRAINT fk_asset_oid_asset_document FOREIGN KEY (asset_oid) REFERENCES public.asset(asset_oid)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE public.asset_license (
	asset_license_oid varchar(128) NOT NULL,
	license_oid varchar(128) NULL,
	asset_owner_oid varchar(128) NULL,
	license_status varchar(128) NULL,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_asset_license PRIMARY KEY (asset_license_oid),
	CONSTRAINT fk_asset_owner_oid_asset_license FOREIGN KEY (asset_owner_oid) REFERENCES public.asset_owner(asset_owner_oid),
	CONSTRAINT fk_license_oid_asset_license FOREIGN KEY (license_oid) REFERENCES public.license(license_oid)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE public.asset_model (
	asset_model_oid varchar(128) NOT NULL,
	organization_oid varchar(128) NOT NULL,
	manufacturer_oid varchar(128) NOT NULL,
	asset_category_oid varchar(128) NOT NULL,
	subcategory_oid varchar(128) NULL,
	asset_model_name varchar(256) NOT NULL,
	asset_model_url varchar(512) NULL,
	asset_model_specification_json text NOT NULL DEFAULT '{}'::text,
	created_by varchar(128) NOT NULL DEFAULT 'System'::character varying,
	created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL,
	updated_on timestamp NULL,
	CONSTRAINT pk_asset_model PRIMARY KEY (asset_model_oid),
	CONSTRAINT fk_asset_category_oid_asset_model FOREIGN KEY (asset_category_oid) REFERENCES public.asset_category(asset_category_oid),
	CONSTRAINT fk_manufacturer_oid_asset_model FOREIGN KEY (manufacturer_oid) REFERENCES public.manufacturer(manufacturer_oid),
	CONSTRAINT fk_organization_oid_asset_model FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid),
	CONSTRAINT fk_subcategory_oid_asset_model FOREIGN KEY (subcategory_oid) REFERENCES public.asset_sub_category(asset_sub_category_oid)
)
WITH (
	OIDS=FALSE
);


CREATE TABLE public.asset_owner (
	asset_owner_oid varchar(128) NOT NULL,
	login_id varchar(128) NULL,
	organization_oid varchar(128) NOT NULL,
	asset_owner_name text NOT NULL,
	asset_owner_unit text NULL,
	asset_owner_designation varchar(128) NULL,
	asset_owner_email varchar(256) NULL,
	asset_owner_mobile_number varchar(32) NULL,
	asset_owner_photo_file_path text NULL,
	asset_owner_status varchar(32) NULL,
	created_by text NOT NULL,
	created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by varchar(128) NULL DEFAULT 'System'::character varying,
	updated_on timestamp NULL,
	CONSTRAINT pk_asset_owner PRIMARY KEY (asset_owner_oid),
	CONSTRAINT fk_login_id_asset_owner FOREIGN KEY (login_id) REFERENCES public.login("oid"),
	CONSTRAINT fk_organization_oid_asset_owner FOREIGN KEY (organization_oid) REFERENCES public.organization(organization_oid)
)
WITH (
	OIDS=FALSE
);


INSERT INTO public.organization
(organization_oid, organization_name, organization_short_name, organization_address, organization_url, organization_data_json, organization_status, organization_logo_file_path, created_by, created_on, updated_by, updated_on)
VALUES('ORG-01', 'National Board of Revenue', NULL, 'Segunbagicha, Dhaka-1000', 'https://www.google.com/search?', '{}', 'Active', 'https://www.google.com/search?', 'System', '2023-01-15 15:41:06.655', NULL, NULL);


INSERT INTO public.department
(department_oid, department_name, department_address, department_email, department_url, organization_oid, department_status, department_logo_file_path, department_data_json, created_by, created_on, updated_by, updated_on)
VALUES('Cust-01', 'National Board of Revenue', 'Shegunbagicha, Dhaka', 'sharafathossain786@gmail.com', NULL, 'ORG-01', 'Active', NULL, '[{"name":"Dashboard","url":"/dashboard","icon":"fa fa-dashboard","enable":true},{"name":"Meta","url":"/meta","icon":"fa fa-cog","enable":true,"children":[{"name":"Asset Category","url":"/meta/asset-category/","icon":"fa fa-life-ring","enable":true},{"name":"Asset Subcategory","url":"/meta/asset-subcategory","icon":"fa fa-sun-o","enable":true}]},{"name":"Master","url":"/master","icon":"fa fa-universal-access","enable":true,"children":[{"name":"Asset Model","url":"/master/asset-model","icon":"fa fa-superpowers","enable":true},{"name":"Manufacturer","url":"/master/manufacturer","icon":"fa fa-ravelry","enable":true},{"name":"Vendor","url":"/master/vendor","icon":"fa fa-snowflake-o","enable":true}]},{"name":"Operation","url":"/operation","icon":"fa fa-industry","enable":true,"children":[{"name":"Organization","url":"/operation/organization","icon":"fa fa-cubes","enable":true},{"name":"Customer","url":"/operation/customer","icon":"fa fa-user","enable":true},{"name":"Site","url":"/operation/site","icon":"fa fa-map","enable":true},{"name":"Asset","url":"/operation/asset","icon":"fa fa-briefcase","enable":true},{"name":"Asset Owner","url":"/operation/asset-owner","icon":"fa fa-male","enable":true},{"name":"Requisition","url":"/operation/requisition","icon":"fa fa-check-square-o","enable":true}]},{"name":"Settings","url":"settings","icon":"fa fa-wrench","enable":true,"children":[{"name":"Users","url":"/settings/user","icon":"fa fa-users","enable":true},{"name":"Role","url":"/settings/role","icon":"fa fa-sitemap","enable":true}]}]', 'System', '2023-01-15 15:41:06.674', NULL, NULL);

INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-01', 'ORG-01', 'Server', '2022-10-03', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-02', 'ORG-01', 'Storage', '2022-10-03', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-03', 'ORG-01', 'Switch', '2022-10-03', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-04', 'ORG-01', 'Router', '2022-10-03', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-05', 'ORG-01', 'Engineered System', '2022-10-03', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-06', 'ORG-01', 'HCI', '2022-10-04', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-07', 'ORG-01', 'Switch', '2022-10-05', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-08', 'ORG-01', 'Router', '2022-10-06', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-09', 'ORG-01', 'Engineered System', '2022-10-07', '2023-01-15 15:41:06.885', 'System', NULL);
INSERT INTO public.asset_category_type
(asset_category_type_oid, organization_oid, asset_category_type_name, created_by, created_on, updated_by, updated_on)
VALUES('cat-10', 'ORG-01', 'HCI', '2022-10-08', '2023-01-15 15:41:06.885', 'System', NULL);


INSERT INTO public.asset_model
(asset_model_oid, organization_oid, manufacturer_oid, asset_category_oid, subcategory_oid, asset_model_name, asset_model_url, asset_model_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('AM-01', 'ORG-01', 'OEM-01', 'cat-01', 'cat-01', 'X3-2', NULL, '{}', 'System', '2023-01-15 15:41:06.949', NULL, NULL);
INSERT INTO public.asset_model
(asset_model_oid, organization_oid, manufacturer_oid, asset_category_oid, subcategory_oid, asset_model_name, asset_model_url, asset_model_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('AM-02', 'ORG-01', 'OEM-01', 'cat-01', 'cat-02', 'X7-2', NULL, '{}', 'System', '2023-01-15 15:41:06.949', NULL, NULL);
INSERT INTO public.asset_model
(asset_model_oid, organization_oid, manufacturer_oid, asset_category_oid, subcategory_oid, asset_model_name, asset_model_url, asset_model_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('AM-03', 'ORG-01', 'OEM-01', 'cat-02', 'cat-03', 'ZS3-2', NULL, '{}', 'System', '2023-01-15 15:41:06.949', NULL, NULL);
INSERT INTO public.asset_model
(asset_model_oid, organization_oid, manufacturer_oid, asset_category_oid, subcategory_oid, asset_model_name, asset_model_url, asset_model_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('AM-04', 'ORG-01', 'OEM-01', 'cat-02', 'cat-04', 'ZS5-2', NULL, '{}', 'System', '2023-01-15 15:41:06.949', NULL, NULL);


INSERT INTO public.asset_sub_category
(asset_sub_category_oid, organization_oid, asset_category_oid, subcategory_name, asset_sub_category_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('cat-01', 'ORG-01', 'cat-01', 'Server', '{}', 'System', '2023-01-15 15:41:06.933', NULL, NULL);
INSERT INTO public.asset_sub_category
(asset_sub_category_oid, organization_oid, asset_category_oid, subcategory_name, asset_sub_category_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('cat-02', 'ORG-01', 'cat-02', 'Storage', '{}', 'System', '2023-01-15 15:41:06.933', NULL, NULL);
INSERT INTO public.asset_sub_category
(asset_sub_category_oid, organization_oid, asset_category_oid, subcategory_name, asset_sub_category_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('cat-03', 'ORG-01', 'cat-03', 'Switch', '{}', 'System', '2023-01-15 15:41:06.933', NULL, NULL);
INSERT INTO public.asset_sub_category
(asset_sub_category_oid, organization_oid, asset_category_oid, subcategory_name, asset_sub_category_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('cat-04', 'ORG-01', 'cat-04', 'Router', '{}', 'System', '2023-01-15 15:41:06.933', NULL, NULL);
INSERT INTO public.asset_sub_category
(asset_sub_category_oid, organization_oid, asset_category_oid, subcategory_name, asset_sub_category_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('cat-05', 'ORG-01', 'cat-05', 'Engineered System', '{}', 'System', '2023-01-15 15:41:06.933', NULL, NULL);
INSERT INTO public.asset_sub_category
(asset_sub_category_oid, organization_oid, asset_category_oid, subcategory_name, asset_sub_category_specification_json, created_by, created_on, updated_by, updated_on)
VALUES('cat-06', 'ORG-01', 'cat-06', 'HCI', '{}', 'System', '2023-01-15 15:41:06.933', NULL, NULL);


INSERT INTO public.site
(site_oid, organization_oid, department_oid, site_code, site_name, site_address, site_url, site_status, site_json, created_by, created_on, updated_by, updated_on)
VALUES('3', 'ORG-01', 'Cust-01', '4443222', 'PHQ-DC', '6,Phoenix Road, Fulbaria Dhaka - 1000', NULL, 'Active', '{}', 'System', '2023-01-15 15:41:06.831', NULL, NULL);


INSERT INTO public.sub_site
(sub_site_oid, organization_oid, department_oid, site_oid, sub_site_name, sub_site_address, sub_site_url, sub_site_status, sub_site_json, created_by, created_on, updated_by, updated_on)
VALUES('sub_site-01', 'ORG-01', 'Cust-01', '1', 'NBR-DC', 'Shegunbagicha, Dhaka', NULL, 'Active', '{}', 'System', '2023-01-15 15:41:06.845', NULL, NULL);
INSERT INTO public.sub_site
(sub_site_oid, organization_oid, department_oid, site_oid, sub_site_name, sub_site_address, sub_site_url, sub_site_status, sub_site_json, created_by, created_on, updated_by, updated_on)
VALUES('sub_site-02', 'ORG-01', 'Cust-01', '2', 'NBR-DR', 'Chittagong Customs House, Chittagong', NULL, 'Active', '{}', 'System', '2023-01-15 15:41:06.845', NULL, NULL);
INSERT INTO public.sub_site
(sub_site_oid, organization_oid, department_oid, site_oid, sub_site_name, sub_site_address, sub_site_url, sub_site_status, sub_site_json, created_by, created_on, updated_by, updated_on)
VALUES('sub_site-03', 'ORG-01', 'Cust-01', '3', 'PHQ-DC', '6,Phoenix Road, Fulbaria Dhaka - 1000', NULL, 'Active', '{}', 'System', '2023-01-15 15:41:06.845', NULL, NULL);

