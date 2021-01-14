// To parse this JSON data, do
//
//     final ordenes = ordenesFromJson(jsonString);

import 'dart:convert';

ModeloOrdenes ordenesFromJson(String str) => ModeloOrdenes.fromJson(json.decode(str));

String ordenesToJson(ModeloOrdenes data) => json.encode(data.toJson());

class ModeloOrdenes {
    ModeloOrdenes({
        this.id,
        this.folio,
        this.producto,
        this.cantidad,
        this.precioXunidad,
        this.precioTotal,
        this.nombreCliente,
        this.telefono,
        this.direccion,
        this.envioEfectivo,
        this.correoCliente,
    });

    String id;
    String folio;
    String producto;
    double cantidad;
    double precioXunidad;
    double precioTotal;
    String nombreCliente;
    int telefono;
    String direccion;
    bool envioEfectivo;
    String correoCliente;

    factory ModeloOrdenes.fromJson(Map<String, dynamic> json) => ModeloOrdenes(
        id: json["id"],
        folio: json["folio"],
        producto: json["producto"],
        cantidad: json["cantidad"].toDouble(),
        precioXunidad: json["precioXunidad"].toDouble(),
        precioTotal: json["precioTotal"].toDouble(),
        nombreCliente: json["nombreCliente"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        envioEfectivo: json["envioEfectivo"],
        correoCliente: json["correoCliente"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "folio": folio,
        "producto": producto,
        "cantidad": cantidad,
        "precioXunidad": precioXunidad,
        "precioTotal": precioTotal,
        "nombreCliente": nombreCliente,
        "telefono": telefono,
        "direccion": direccion,
        "envioEfectivo": envioEfectivo,
        "correoCliente": correoCliente,
    };
}
