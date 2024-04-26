# api-parking-control

API  Parking Spot Control
Banco PostgreSQL


Pacotes:
- config
- controllers
- dto
- models
- repositories
- services

Exemplos:
- Usando Paginação no getAll()
```java
@GetMapping
   public ResponseEntity<Page<ParkingSpotModel>> getAllParkingSpots(@PageableDefault(page = 0, size = 10, sort = "id", direction = Sort.Direction.ASC) Pageable pageable){
	   return ResponseEntity.status(HttpStatus.OK).body(parkingSpotService.findAll(pageable));
   }
```

- Usando BeanUtils
```java
@PutMapping("/{id}")
   public ResponseEntity<Object> updateParkingSpot(@PathVariable(value="id") UUID id, @RequestBody @Valid ParkingSpotDto parkingSpotDto){
	   Optional<ParkingSpotModel> parkingSpotOptional = parkingSpotService.findById(id);
	   if(!parkingSpotOptional.isPresent()) {
		   return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Parking Spot not found!");
	   }
	   
	   var parkingSpotModel = new ParkingSpotModel();
	   
	   BeanUtils.copyProperties(parkingSpotDto, parkingSpotModel);
	   parkingSpotModel.setId(parkingSpotOptional.get().getId()); // permanecer o mesmo Id
	   parkingSpotModel.setRegistrationDate(parkingSpotOptional.get().getRegistrationDate()); // permanecer a mesma RegistrationDate
	   return ResponseEntity.status(HttpStatus.OK).body(parkingSpotService.save(parkingSpotModel));
	   
   }
``
