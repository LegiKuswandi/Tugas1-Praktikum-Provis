import 'dart:async';

// Kelas dasar untuk hewan-hewan di kebun binatang
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print('$name sedang makan.');
  }

  void sleep() {
    print('$name sedang tidur.');
  }

  // Metode async yang mensimulasikan suatu aksi yang memakan waktu
  Future<void> makeSound() async {
    await Future.delayed(Duration(seconds: 2));
    print('$name sedang membuat suara.');
  }
}

// Kelas untuk hewan-hewan yang dapat terbang
class FlyingAnimal extends Animal {
  FlyingAnimal(String name, int age) : super(name, age);

  void fly() {
    print('$name sedang terbang.');
  }
}

// Kelas untuk hewan-hewan yang berenang
class SwimmingAnimal extends Animal {
  SwimmingAnimal(String name, int age) : super(name, age);

  void swim() {
    print('$name sedang berenang.');
  }
}

// Kelas untuk hewan-hewan di kebun binatang
class Zoo {
  List<Animal> animals = [];

  // Menambahkan hewan ke dalam kebun binatang
  void addAnimal(Animal animal) {
    animals.add(animal);
    print('${animal.name} telah ditambahkan ke kebun binatang.');
  }

  // Mengelilingi kebun binatang dan memanggil metode makeSound secara asynchronous
  Future<void> tourZoo() async {
    print('Memulai tur kebun binatang...');
    for (var animal in animals) {
      print('Saat ini di dekat ${animal.name}.');
      await animal.makeSound();
    }
    print('Tur kebun binatang selesai.');
  }
}

void main() {
  // Membuat beberapa hewan
  var lion = Animal('Singa', 5);
  var eagle = FlyingAnimal('Elang', 3);
  var shark = SwimmingAnimal('Hiu', 7);

  // Membuat sebuah kebun binatang
  var zoo = Zoo();

  // Menambahkan hewan-hewan ke dalam kebun binatang
  zoo.addAnimal(lion);
  zoo.addAnimal(eagle);
  zoo.addAnimal(shark);

  // Melakukan tur kebun binatang secara asynchronous
  zoo.tourZoo();
}
