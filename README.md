# Car Owners Database example


## Description

This repository contains a simple mySql database schema and sample data for managing car owners. It includes tables for car owners and their cars.

## Tables

### Owners

#### Columns:
- `id`: Unique identifier for each owner.
- `first_name`: First name of the owner.
- `last_name`: Last name of the owner.
- `address`: Address of the owner.
- `email`: Email address of the owner.
- `phone_number`: Phone number of the owner.

### Cars

#### Columns:
- `id`: Unique identifier for each car.
- `owner_id`: Foreign key referencing the `id` in the `Owners` table.
- `brand`: Brand of the car.
- `model`: Model of the car.
- `color`: Color of the car.
- `year`: Year of the car.

This file provides a brief overview of the database structure for managing car owners and their cars.

