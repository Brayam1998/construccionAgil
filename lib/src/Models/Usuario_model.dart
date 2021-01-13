

// To parse this JSON data, do
//
//     final construccionagil4C8F1DefaultRtdbExport = construccionagil4C8F1DefaultRtdbExportFromJson(jsonString);

import 'dart:convert';

ModeloDeUsuario modeloDeUsuarioFromJson(String str) => ModeloDeUsuario.fromJson(json.decode(str));

String modeloDeUsuariotoJson(ModeloDeUsuario data) => json.encode(data.toJson());

class ModeloDeUsuario {
    ModeloDeUsuario({
        this.email,
        this.noCuenta,
        this.noTarjeta,
        this.nombreEmpresa = "Muestra",
        this.telefono,
        this.zona,
        this.direccion,
        this.id,
    });

    String email;
    int noCuenta;
    int noTarjeta;
    String nombreEmpresa;
    int telefono;
    int zona;
    String direccion;
    int id;

    factory ModeloDeUsuario.fromJson(Map<String, dynamic> json) => new ModeloDeUsuario(
        email: json["Email"],
        noCuenta: json["NoCuenta"].toDouble(),
        noTarjeta: json["NoTarjeta"],
        nombreEmpresa: json["Nombre_Empresa"],
        telefono: json["Telefono"],
        zona: json["Zona"],
        direccion :json["direccion"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "Email": email,
        "NoCuenta": noCuenta,
        "NoTarjeta": noTarjeta,
        "Nombre_Empresa": nombreEmpresa,
        "Telefono": telefono,
        "Zona": zona,
        "direccion": direccion,
        "id": id,
    };
}

 /*class Direccion {
    Direccion({
        this.calle,
        this.numero,
    });

    String calle;
    int numero;

    factory Direccion.fromJson(Map<String, dynamic> json) => Direccion(
        calle: json["Calle"],
        numero: json["Numero"],
    );

    Map<String, dynamic> toJson() => {
        "Calle": calle,
        "Numero": numero,
    };*/
