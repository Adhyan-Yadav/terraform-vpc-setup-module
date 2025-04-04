resource "aws_vpc" "webserver_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {                                 #public subnet
  vpc_id                  = aws_vpc.webserver_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone_public

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private" {                                 #private subnet
  vpc_id                  = aws_vpc.webserver_vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone_private

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.webserver_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "public_rt" {                           #public route table
  vpc_id = aws_vpc.webserver_vpc.id

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route" "default_route" {                             #adding default routes to the public  route table
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {            #associating the public subnet to the route table
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {                          #private route table
  vpc_id = aws_vpc.webserver_vpc.id

  tags = {
    Name = "Private Route Table"
  }
}


resource "aws_route_table_association" "private_assoc" {           #associating private routes to the private route table
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
