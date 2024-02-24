#Model#
USE Electric_vehicle;

DROP VIEW IF EXISTS make_model;

CREATE VIEW make_model AS
SELECT * FROM make;


SELECT make.make AS 'make', model.model AS 'model', clean_eligibility.CAFV_Eligibility
FROM model
JOIN clean_eligibility ON clean_eligibility.eligibility_id = model.eligibility_id
JOIN make_model AS make ON model.make_id = make.make_id
JOIN vehicle ON vehicle.model_id = model.model_id
JOIN vehicle_location ON vehicle_location.vehicle_id = vehicle.vehicle_id
JOIN location ON location.location_id = vehicle_location.location_id
WHERE location.county = 'King';


#Make#
USE Electric_vehicle;
DROP VIEW IF EXISTS electric_vehicle_model;
CREATE VIEW electric_vehicle_model AS
SELECT make.make AS 'make', model.model AS 'model', electric_vehicle_type.electric_vehicle_type
FROM model
JOIN electric_vehicle_type ON electric_vehicle_type.type_id = model.type_id
JOIN make ON model.make_id = make.make_id
JOIN vehicle ON vehicle.model_id = model.model_id
JOIN vehicle_location ON vehicle_location.vehicle_id = vehicle.vehicle_id
JOIN location ON location.location_id = vehicle_location.location_id
WHERE location.county = 'King';
select * from electric_vehicle_model;

#electric_vehicle_type#
use electric_vehicle;
SELECT * from electric_vehicle_type;
use electric_vehicle;
CREATE VIEW  Electricrange_model
AS
SELECT electric_vehicle_type, electric_range 
FROM electric_vehicle.electric_vehicle_type
 JOIN model on electric_vehicle_type.type_id = model.type_id
 WHERE electric_range >= 200;
SELECT * from Electricrange_model;

#Vehicle#
USE electric_vehicle;
CREATE VIEW VehicleCityCount AS
SELECT location.city, COUNT(vehicle.vehicle_id) AS vehicle_count
FROM vehicle
JOIN vehicle_location ON vehicle.vehicle_id = vehicle_location.vehicle_id
JOIN location ON vehicle_location.location_id = location.location_id
GROUP BY location.city;
SELECT * FROM VehicleCityCount;


USE electric_vehicle;
CREATE VIEW LocationModel AS
SELECT vehicle.vehicle_id, vehicle.model_id, vehicle_location.location_id
FROM vehicle 
JOIN vehicle_location ON vehicle.vehicle_id = vehicle_location.vehicle_id
WHERE vehicle.model_id = 5;
SELECT * FROM LocationModel;




USE electric_vehicle;
CREATE VIEW VehicleCountyCount AS
SELECT location.county, COUNT(vehicle.vehicle_id) AS vehicle_count
FROM vehicle
JOIN vehicle_location ON vehicle.vehicle_id = vehicle_location.vehicle_id
JOIN location ON vehicle_location.location_id = location.location_id
GROUP BY location.county;
SELECT * FROM VehicleCountyCount;


USE electric_vehicle;
CREATE VIEW VehicleLocation AS
SELECT vehicle.vehicle_id, vehicle.model_id, vehicle_location.location_id,
       location.county, location.city, location.2020_census_tract, location.postal_code #Ignore error message
FROM vehicle
JOIN vehicle_location ON vehicle.vehicle_id = vehicle_location.vehicle_id
JOIN location ON vehicle_location.location_id = location.location_id;
SELECT * FROM VehicleLocation;



USE electric_vehicle;
CREATE VIEW FiltertingView AS
SELECT vehicle_id, model_id
FROM vehicle
WHERE model_id > 1 AND vehicle_id IN (SELECT vehicle_id FROM vehicle_location WHERE location_id = 5);
SELECT * FROM FiltertingView;





