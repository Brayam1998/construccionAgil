// To parse this JSON data, do
//
//     final modeloDeProductos = modeloDeProductosFromJson(jsonString);

import 'dart:convert';

ModeloDeProductos modeloDeProductosFromJson(String str) => ModeloDeProductos.fromJson(json.decode(str));

String modeloDeProductosToJson(ModeloDeProductos data) => json.encode(data.toJson()); // funcion que regresa el modelo como un string

class ModeloDeProductos {
    ModeloDeProductos({
        this.id,
        this.nombre,
        this.precioProvedor=0.0,
        this.precioMaximo = 0.0,
        this.cantidad = 0,
        this.disponible = false,
        this.fotUrl,
    });

    String id;
    String nombre;
    double precioProvedor;
    double precioMaximo;
    int cantidad;
    bool disponible;
    String fotUrl;

    factory ModeloDeProductos.fromJson(Map<String, dynamic> json) => ModeloDeProductos(
        id             : json["id"],
        nombre         : json["nombre"],
        precioProvedor : json["precioProvedor"],
        precioMaximo   : json["precioMaximo"],
        cantidad       : json["cantidad"],
        disponible     : json["disponible"],
        fotUrl         : json["fotUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precioProvedor": precioProvedor,
        "precioMaximo": precioMaximo,
        "cantidad": cantidad,
        "disponible": disponible,
        "fotUrl": fotUrl,
    };
}
