-- CreateTable
CREATE TABLE "Usuario" (
    "id_voluntario" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_voluntario")
);

-- CreateTable
CREATE TABLE "Voluntario" (
    "id_voluntario" SERIAL NOT NULL,

    CONSTRAINT "Voluntario_pkey" PRIMARY KEY ("id_voluntario")
);

-- CreateTable
CREATE TABLE "Emergencia" (
    "id_emergencia" SERIAL NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "direccion" TEXT NOT NULL,
    "cel_ref" TEXT NOT NULL,
    "nombrePersona" TEXT NOT NULL,
    "tipoRecepcion" TEXT NOT NULL,
    "id_gravedad" INTEGER NOT NULL,
    "id_voluntario" INTEGER NOT NULL,

    CONSTRAINT "Emergencia_pkey" PRIMARY KEY ("id_emergencia")
);

-- CreateTable
CREATE TABLE "TipoEmergencia" (
    "id_tipoEmergencia" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,

    CONSTRAINT "TipoEmergencia_pkey" PRIMARY KEY ("id_tipoEmergencia")
);

-- CreateTable
CREATE TABLE "Emer_tiene_TipoEmer" (
    "id_emergencia" INTEGER NOT NULL,
    "id_tipoEmergencia" INTEGER NOT NULL,

    CONSTRAINT "Emer_tiene_TipoEmer_pkey" PRIMARY KEY ("id_emergencia","id_tipoEmergencia")
);

-- CreateTable
CREATE TABLE "Gravedad" (
    "id_gravedad" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Gravedad_pkey" PRIMARY KEY ("id_gravedad")
);

-- CreateTable
CREATE TABLE "Vehiculo" (
    "id_vehiculo" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "kilometrajeUtilizado" INTEGER NOT NULL,

    CONSTRAINT "Vehiculo_pkey" PRIMARY KEY ("id_vehiculo")
);

-- CreateTable
CREATE TABLE "loteVehiculo" (
    "id_loteVehiculo" SERIAL NOT NULL,
    "stock" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "id_vehiculo" INTEGER NOT NULL,

    CONSTRAINT "loteVehiculo_pkey" PRIMARY KEY ("id_loteVehiculo")
);

-- CreateTable
CREATE TABLE "lotVehi_contiene_ingInfVehi" (
    "id_loteVehiculo" INTEGER NOT NULL,
    "id_informeIngresoVehiculo" INTEGER NOT NULL,

    CONSTRAINT "lotVehi_contiene_ingInfVehi_pkey" PRIMARY KEY ("id_loteVehiculo","id_informeIngresoVehiculo")
);

-- CreateTable
CREATE TABLE "ingresoInformeVehiculo" (
    "id_ingresoInformeVehiculo" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "modelo" TEXT NOT NULL,
    "anioFabricacion" INTEGER NOT NULL,
    "numeroPlaca" TEXT NOT NULL,
    "numeroSerie" TEXT NOT NULL,
    "kilometrajeIngreso" INTEGER NOT NULL,
    "descripcion" TEXT NOT NULL,
    "intervaloTiempoRevision" TEXT NOT NULL,
    "registroDocumentacion" TEXT NOT NULL,
    "id_voluntario" INTEGER NOT NULL,
    "id_loteVehiculo" INTEGER,

    CONSTRAINT "ingresoInformeVehiculo_pkey" PRIMARY KEY ("id_ingresoInformeVehiculo")
);

-- CreateTable
CREATE TABLE "Mantenimiento" (
    "id_mantenimiento" SERIAL NOT NULL,
    "descripcion" TEXT NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_vehiculo" INTEGER NOT NULL,
    "id_voluntario" INTEGER NOT NULL,

    CONSTRAINT "Mantenimiento_pkey" PRIMARY KEY ("id_mantenimiento")
);

-- CreateTable
CREATE TABLE "Vehi_participo_emer" (
    "id_vehiculo" INTEGER NOT NULL,
    "id_emergencia" INTEGER NOT NULL,

    CONSTRAINT "Vehi_participo_emer_pkey" PRIMARY KEY ("id_vehiculo","id_emergencia")
);

-- CreateTable
CREATE TABLE "Vol_recepcion_emer" (
    "id_voluntario" INTEGER NOT NULL,
    "id_emergencia" INTEGER NOT NULL,

    CONSTRAINT "Vol_recepcion_emer_pkey" PRIMARY KEY ("id_voluntario","id_emergencia")
);

-- CreateTable
CREATE TABLE "registroMaterial" (
    "id_registroMaterial" SERIAL NOT NULL,
    "nombre" TEXT,

    CONSTRAINT "registroMaterial_pkey" PRIMARY KEY ("id_registroMaterial")
);

-- CreateTable
CREATE TABLE "loteMaterial" (
    "id_loteMaterial" SERIAL NOT NULL,
    "stock" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,

    CONSTRAINT "loteMaterial_pkey" PRIMARY KEY ("id_loteMaterial")
);

-- CreateTable
CREATE TABLE "informeIngresoMaterial" (
    "id_informeIngresoMaterial" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "modelo" TEXT NOT NULL,
    "numSerie" TEXT NOT NULL,
    "fechaAdquisicion" TIMESTAMP(3) NOT NULL,
    "capacidad" TEXT NOT NULL,
    "caracteristicas" TEXT NOT NULL,
    "historial" TEXT NOT NULL,
    "responsableEquipo" TEXT NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "cantidadUnidad" INTEGER NOT NULL,
    "unidadMedida" TEXT NOT NULL,
    "fechaLimiteUso" TIMESTAMP(3) NOT NULL,
    "intervaloTiempoRevision" TEXT NOT NULL,
    "id_voluntario" INTEGER NOT NULL,
    "id_loteMaterial" INTEGER,

    CONSTRAINT "informeIngresoMaterial_pkey" PRIMARY KEY ("id_informeIngresoMaterial")
);

-- CreateTable
CREATE TABLE "Emergencia_utilizo_registroMaterial" (
    "id_emergencia" INTEGER NOT NULL,
    "id_registroMaterial" INTEGER NOT NULL,

    CONSTRAINT "Emergencia_utilizo_registroMaterial_pkey" PRIMARY KEY ("id_emergencia","id_registroMaterial")
);

-- CreateTable
CREATE TABLE "lotMater_contiene_infIngMater" (
    "id_loteMaterial" INTEGER NOT NULL,
    "id_informeIngresoMaterial" INTEGER NOT NULL,

    CONSTRAINT "lotMater_contiene_infIngMater_pkey" PRIMARY KEY ("id_loteMaterial","id_informeIngresoMaterial")
);

-- CreateTable
CREATE TABLE "regisMate_tiene_loteMatel" (
    "id_registroMaterial" INTEGER NOT NULL,
    "id_loteMaterial" INTEGER NOT NULL,

    CONSTRAINT "regisMate_tiene_loteMatel_pkey" PRIMARY KEY ("id_registroMaterial","id_loteMaterial")
);

-- CreateTable
CREATE TABLE "informeEmergencia" (
    "id_informeEmergencia" SERIAL NOT NULL,
    "descripcion" TEXT NOT NULL,
    "id_Emergencia" INTEGER NOT NULL,
    "id_voluntario" INTEGER NOT NULL,

    CONSTRAINT "informeEmergencia_pkey" PRIMARY KEY ("id_informeEmergencia")
);

-- CreateTable
CREATE TABLE "Maquinista" (
    "id_voluntario" INTEGER NOT NULL,
    "tipoLicencia" TEXT NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Maquinista_pkey" PRIMARY KEY ("id_voluntario")
);

-- CreateTable
CREATE TABLE "Maqui_condujo_vehi" (
    "id_voluntario" INTEGER NOT NULL,
    "id_vehiculo" INTEGER NOT NULL,

    CONSTRAINT "Maqui_condujo_vehi_pkey" PRIMARY KEY ("id_voluntario","id_vehiculo")
);

-- CreateTable
CREATE TABLE "registroProducto" (
    "id_registroProducto" SERIAL NOT NULL,
    "destino" TEXT NOT NULL,
    "unidad" TEXT NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "id_emergencia" INTEGER NOT NULL,

    CONSTRAINT "registroProducto_pkey" PRIMARY KEY ("id_registroProducto")
);

-- CreateTable
CREATE TABLE "loteProducto" (
    "id_loteProducto" SERIAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "stock" INTEGER NOT NULL,

    CONSTRAINT "loteProducto_pkey" PRIMARY KEY ("id_loteProducto")
);

-- CreateTable
CREATE TABLE "lotProduc_proviene_regisProd" (
    "id_loteProducto" INTEGER NOT NULL,
    "id_registroProducto" INTEGER NOT NULL,

    CONSTRAINT "lotProduc_proviene_regisProd_pkey" PRIMARY KEY ("id_loteProducto","id_registroProducto")
);

-- CreateTable
CREATE TABLE "informeIngresoProducto" (
    "id_informeIngresoProducto" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "cantidadUnidad" INTEGER NOT NULL,
    "unidadMedida" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "fechaCreacion" TIMESTAMP(3) NOT NULL,
    "fechaCaducidad" TIMESTAMP(3) NOT NULL,
    "registroMantenimiento" TEXT NOT NULL,
    "fechaAdquisicion" TIMESTAMP(3) NOT NULL,
    "id_voluntario" INTEGER NOT NULL,
    "id_loteProducto" INTEGER,

    CONSTRAINT "informeIngresoProducto_pkey" PRIMARY KEY ("id_informeIngresoProducto")
);

-- CreateTable
CREATE TABLE "lotProduc_tiene_infIngProduc" (
    "id_loteProducto" INTEGER NOT NULL,
    "id_informeIngresoProducto" INTEGER NOT NULL,

    CONSTRAINT "lotProduc_tiene_infIngProduc_pkey" PRIMARY KEY ("id_loteProducto","id_informeIngresoProducto")
);

-- CreateTable
CREATE TABLE "Turno" (
    "id_turno" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Turno_pkey" PRIMARY KEY ("id_turno")
);

-- CreateTable
CREATE TABLE "Cargo" (
    "id_cargo" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Cargo_pkey" PRIMARY KEY ("id_cargo")
);

-- CreateTable
CREATE TABLE "Rol" (
    "id_rol" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Rol_pkey" PRIMARY KEY ("id_rol")
);

-- CreateTable
CREATE TABLE "TurnoTrayecto" (
    "id_turnoTrayecto" SERIAL NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_turno" INTEGER NOT NULL,
    "d_voluntario" INTEGER NOT NULL,

    CONSTRAINT "TurnoTrayecto_pkey" PRIMARY KEY ("id_turnoTrayecto")
);

-- CreateTable
CREATE TABLE "CargoTrayecto" (
    "id_cargoTrayecto" SERIAL NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_cargo" INTEGER NOT NULL,
    "d_voluntario" INTEGER NOT NULL,

    CONSTRAINT "CargoTrayecto_pkey" PRIMARY KEY ("id_cargoTrayecto")
);

-- CreateTable
CREATE TABLE "RolTrayecto" (
    "id_rolTrayecto" SERIAL NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_rol" INTEGER NOT NULL,
    "d_voluntario" INTEGER NOT NULL,

    CONSTRAINT "RolTrayecto_pkey" PRIMARY KEY ("id_rolTrayecto")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- AddForeignKey
ALTER TABLE "Usuario" ADD CONSTRAINT "Usuario_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emergencia" ADD CONSTRAINT "Emergencia_id_gravedad_fkey" FOREIGN KEY ("id_gravedad") REFERENCES "Gravedad"("id_gravedad") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emergencia" ADD CONSTRAINT "Emergencia_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emer_tiene_TipoEmer" ADD CONSTRAINT "Emer_tiene_TipoEmer_id_emergencia_fkey" FOREIGN KEY ("id_emergencia") REFERENCES "Emergencia"("id_emergencia") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emer_tiene_TipoEmer" ADD CONSTRAINT "Emer_tiene_TipoEmer_id_tipoEmergencia_fkey" FOREIGN KEY ("id_tipoEmergencia") REFERENCES "TipoEmergencia"("id_tipoEmergencia") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "loteVehiculo" ADD CONSTRAINT "loteVehiculo_id_vehiculo_fkey" FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculo"("id_vehiculo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotVehi_contiene_ingInfVehi" ADD CONSTRAINT "lotVehi_contiene_ingInfVehi_id_loteVehiculo_fkey" FOREIGN KEY ("id_loteVehiculo") REFERENCES "loteVehiculo"("id_loteVehiculo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotVehi_contiene_ingInfVehi" ADD CONSTRAINT "lotVehi_contiene_ingInfVehi_id_informeIngresoVehiculo_fkey" FOREIGN KEY ("id_informeIngresoVehiculo") REFERENCES "ingresoInformeVehiculo"("id_ingresoInformeVehiculo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ingresoInformeVehiculo" ADD CONSTRAINT "ingresoInformeVehiculo_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ingresoInformeVehiculo" ADD CONSTRAINT "ingresoInformeVehiculo_id_loteVehiculo_fkey" FOREIGN KEY ("id_loteVehiculo") REFERENCES "loteVehiculo"("id_loteVehiculo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Mantenimiento" ADD CONSTRAINT "Mantenimiento_id_vehiculo_fkey" FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculo"("id_vehiculo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Mantenimiento" ADD CONSTRAINT "Mantenimiento_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehi_participo_emer" ADD CONSTRAINT "Vehi_participo_emer_id_vehiculo_fkey" FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculo"("id_vehiculo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehi_participo_emer" ADD CONSTRAINT "Vehi_participo_emer_id_emergencia_fkey" FOREIGN KEY ("id_emergencia") REFERENCES "Emergencia"("id_emergencia") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vol_recepcion_emer" ADD CONSTRAINT "Vol_recepcion_emer_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vol_recepcion_emer" ADD CONSTRAINT "Vol_recepcion_emer_id_emergencia_fkey" FOREIGN KEY ("id_emergencia") REFERENCES "Emergencia"("id_emergencia") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "informeIngresoMaterial" ADD CONSTRAINT "informeIngresoMaterial_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "informeIngresoMaterial" ADD CONSTRAINT "informeIngresoMaterial_id_loteMaterial_fkey" FOREIGN KEY ("id_loteMaterial") REFERENCES "loteMaterial"("id_loteMaterial") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emergencia_utilizo_registroMaterial" ADD CONSTRAINT "Emergencia_utilizo_registroMaterial_id_emergencia_fkey" FOREIGN KEY ("id_emergencia") REFERENCES "Emergencia"("id_emergencia") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emergencia_utilizo_registroMaterial" ADD CONSTRAINT "Emergencia_utilizo_registroMaterial_id_registroMaterial_fkey" FOREIGN KEY ("id_registroMaterial") REFERENCES "registroMaterial"("id_registroMaterial") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotMater_contiene_infIngMater" ADD CONSTRAINT "lotMater_contiene_infIngMater_id_loteMaterial_fkey" FOREIGN KEY ("id_loteMaterial") REFERENCES "loteMaterial"("id_loteMaterial") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotMater_contiene_infIngMater" ADD CONSTRAINT "lotMater_contiene_infIngMater_id_informeIngresoMaterial_fkey" FOREIGN KEY ("id_informeIngresoMaterial") REFERENCES "informeIngresoMaterial"("id_informeIngresoMaterial") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "regisMate_tiene_loteMatel" ADD CONSTRAINT "regisMate_tiene_loteMatel_id_registroMaterial_fkey" FOREIGN KEY ("id_registroMaterial") REFERENCES "registroMaterial"("id_registroMaterial") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "regisMate_tiene_loteMatel" ADD CONSTRAINT "regisMate_tiene_loteMatel_id_loteMaterial_fkey" FOREIGN KEY ("id_loteMaterial") REFERENCES "loteMaterial"("id_loteMaterial") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "informeEmergencia" ADD CONSTRAINT "informeEmergencia_id_Emergencia_fkey" FOREIGN KEY ("id_Emergencia") REFERENCES "Emergencia"("id_emergencia") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "informeEmergencia" ADD CONSTRAINT "informeEmergencia_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Maquinista" ADD CONSTRAINT "Maquinista_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Maqui_condujo_vehi" ADD CONSTRAINT "Maqui_condujo_vehi_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Maqui_condujo_vehi" ADD CONSTRAINT "Maqui_condujo_vehi_id_vehiculo_fkey" FOREIGN KEY ("id_vehiculo") REFERENCES "Vehiculo"("id_vehiculo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "registroProducto" ADD CONSTRAINT "registroProducto_id_emergencia_fkey" FOREIGN KEY ("id_emergencia") REFERENCES "Emergencia"("id_emergencia") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotProduc_proviene_regisProd" ADD CONSTRAINT "lotProduc_proviene_regisProd_id_loteProducto_fkey" FOREIGN KEY ("id_loteProducto") REFERENCES "loteProducto"("id_loteProducto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotProduc_proviene_regisProd" ADD CONSTRAINT "lotProduc_proviene_regisProd_id_registroProducto_fkey" FOREIGN KEY ("id_registroProducto") REFERENCES "registroProducto"("id_registroProducto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "informeIngresoProducto" ADD CONSTRAINT "informeIngresoProducto_id_voluntario_fkey" FOREIGN KEY ("id_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "informeIngresoProducto" ADD CONSTRAINT "informeIngresoProducto_id_loteProducto_fkey" FOREIGN KEY ("id_loteProducto") REFERENCES "loteProducto"("id_loteProducto") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotProduc_tiene_infIngProduc" ADD CONSTRAINT "lotProduc_tiene_infIngProduc_id_loteProducto_fkey" FOREIGN KEY ("id_loteProducto") REFERENCES "loteProducto"("id_loteProducto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lotProduc_tiene_infIngProduc" ADD CONSTRAINT "lotProduc_tiene_infIngProduc_id_informeIngresoProducto_fkey" FOREIGN KEY ("id_informeIngresoProducto") REFERENCES "informeIngresoProducto"("id_informeIngresoProducto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TurnoTrayecto" ADD CONSTRAINT "TurnoTrayecto_id_turno_fkey" FOREIGN KEY ("id_turno") REFERENCES "Turno"("id_turno") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TurnoTrayecto" ADD CONSTRAINT "TurnoTrayecto_d_voluntario_fkey" FOREIGN KEY ("d_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CargoTrayecto" ADD CONSTRAINT "CargoTrayecto_id_cargo_fkey" FOREIGN KEY ("id_cargo") REFERENCES "Cargo"("id_cargo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CargoTrayecto" ADD CONSTRAINT "CargoTrayecto_d_voluntario_fkey" FOREIGN KEY ("d_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolTrayecto" ADD CONSTRAINT "RolTrayecto_id_rol_fkey" FOREIGN KEY ("id_rol") REFERENCES "Rol"("id_rol") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolTrayecto" ADD CONSTRAINT "RolTrayecto_d_voluntario_fkey" FOREIGN KEY ("d_voluntario") REFERENCES "Voluntario"("id_voluntario") ON DELETE RESTRICT ON UPDATE CASCADE;
