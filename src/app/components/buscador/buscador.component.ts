import { Component, OnInit } from '@angular/core';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UsuariosService } from '../../services/usuarios.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { ApiResponse } from '../../model/api-response';
import { environment } from 'src/environments/environment';
import { TranslateService } from '@ngx-translate/core';
import { Usuarios } from 'src/app/model/usuarios';
import { medicamentoId } from 'src/app/model/medicamentoId';
import { consultarmedicament } from 'src/app/model/consultarmedicament';

@Component({
  selector: 'app-buscador',
  templateUrl: './buscador.component.html',
  styleUrls: ['./buscador.component.css']
})
export class BuscadorComponent implements OnInit {

  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    private apiService: UsuariosService,
    public translate: TranslateService
  ) {    this.translate.addLangs(['es', 'en']), this.translate.setDefaultLang('es');  }

  searchForm: FormGroup;
  invalidLogin: boolean = false;
  submitted: boolean = false;
  contrasenyaNoCoincideix: boolean = false;
  usuariNoExisteix: boolean = false;
  missatgeData: any;
  correuData: any;
  loginData: null;
  query: string;
  resultat: any;
  medicamentos: any;

  query00: string;
  query01: string; query101: string; query201: string;
  query02: string; query102: string; query202: string;
  query03: string; query103: string; query203: string;
  query04: string; query104: string; query204: string;
  query05: string; query105: string; query205: string;
  query06: string; query106: string; query206: string;
  queryWhere: string;

  ngOnInit(): void {
    this.searchForm = this.formBuilder.group({
      nombre: ['', Validators.maxLength(30)],
      codigo_barras: [0, Validators.maxLength(30)],
      patologia: ['', Validators.maxLength(30)],
      laboratorio: ['', Validators.maxLength(30)],
      efect_second: ['', Validators.maxLength(30)],
      form_farm: ['', Validators.maxLength(30)],
    });
    this.submitted = false;
    this.query = "";
    this.query00 = "a.id_medicament ";
    this.query01 = ""; this.query101 = ""; this.query201 = "";
    this.query02 = ""; this.query102 = ""; this.query202 = "";
    this.query03 = ""; this.query103 = ""; this.query203 = "";
    this.query04 = ""; this.query104 = ""; this.query204 = "";
    this.query05 = ""; this.query105 = ""; this.query205 = "";
    this.query06 = ""; this.query106 = ""; this.query206 = "";
    this.queryWhere = "";
  }

  get f(){
    return this.searchForm.controls;
  }

  onSubmit(){
    this.submitted = true;
    console.log("Valor del formulari tal qual");
    console.log(this.searchForm.value);

    const loginData = {
      nombre: this.searchForm.controls.nombre.value,
      codigo_barras: this.searchForm.controls.codigo_barras.value,
      patologia: this.searchForm.controls.patologia.value,
      laboratorio: this.searchForm.controls.laboratorio.value,
      efect_second: this.searchForm.controls.efect_second.value,
      form_farm: this.searchForm.controls.form_farm.value
    };

    if(this.searchForm.controls.nombre.value !== ""){
      this.queryWhere = " WHERE ";
      this.query01 = "a.nom ";
      this.query101 = " a.nom LIKE '%"+loginData.nombre+"%'";
      this.query201 = "";
      if((loginData.codigo_barras !== 0) ||
      (loginData.patologia !== "") ||
      (loginData.laboratorio !== "") ||
      (loginData.efect_second !== "") ||
      (loginData.form_farm !== "")) {
        this.query01 = this.query01+" ";
        this.query201 = this.query201+", ";
        this.query101 = this.query101+" AND ";
      }
    }
    if(this.searchForm.controls.codigo_barras.value !== 0){
      this.queryWhere = " WHERE ";
      this.query02 = "a.codi_barres ";
      this.query102 = " a.codi_barres = "+loginData.codigo_barras;
      this.query201 = "";
      loginData.codigo_barras = +loginData.codigo_barras;
      if((loginData.patologia !== "") ||
      (loginData.laboratorio !== "") ||
      (loginData.efect_second !== "") ||
      (loginData.form_farm !== "")) {
        this.query02 = this.query02+", ";
        this.query201 = this.query201+", ";
        this.query102 = this.query102+" AND ";
      }
    }
    if(this.searchForm.controls.patologia.value !== ""){
      this.query201 = ", ";
      this.queryWhere = " WHERE ";
      this.query03 = " b.descripcio ";
      this.query103 = " a.id_medicament IN (SELECT id_medicament FROM patologia WHERE descripcio LIKE '%"+loginData.patologia+"%')";
      this.query203 = " patologia AS B";
      loginData.patologia = "'"+loginData.patologia+"'";
      if((loginData.laboratorio !== "") ||
      (loginData.efect_second !== "") ||
      (loginData.form_farm !== "")) {
        this.query03 = this.query03+", ";
        this.query203 = this.query203+", ";
        this.query201 = this.query201+", ";
        this.query103 = this.query103+" AND ";
      }
    }
    if(this.searchForm.controls.laboratorio.value !== ""){
      this.query201 = ", ";
      this.queryWhere = " WHERE ";
      this.query04 = " c.nom ";
      this.query104 = " a.id_medicament IN (SELECT id_medicament FROM laboratori WHERE nom LIKE '%"+loginData.laboratorio+"%')";
      this.query204 = " laboratori AS C";
      loginData.laboratorio = "'"+loginData.laboratorio+"'";
      if((loginData.efect_second !== "") ||
      (loginData.form_farm !== "")) {
        this.query04 = this.query04+", ";
        this.query204 = this.query204+", ";
        this.query201 = this.query201+", ";
        this.query104 = this.query104+" AND ";
      }
    }
    if(this.searchForm.controls.efect_second.value !== ""){
      this.query201 = ", ";
      this.queryWhere = " WHERE ";
      this.query05 = " d.descripcio ";
      this.query105 = " a.id_medicament IN (SELECT id_medicament FROM efectes_secundaris WHERE descripcio LIKE '%"+loginData.efect_second+"%')";
      this.query205 = " efectes_secundaris AS D";
      loginData.efect_second = "'"+loginData.efect_second+"'";
      if(loginData.form_farm !== "") {
        this.query05 = this.query05+", ";
        this.query205 = this.query205+", ";
        this.query201 = this.query201+", ";
        this.query105 = this.query105+" AND ";
      }
    }
    if(this.searchForm.controls.form_farm.value !== ""){
      this.query201 = ", ";
      this.queryWhere = " WHERE ";
      this.query06 = " e.descripcio";
      this.query106 = " a.id_medicament IN (SELECT id_medicament FROM forma_farmaceutica WHERE descripcio LIKE '%"+loginData.form_farm+"%')";
      this.query206 = " forma_farmaceutica AS E";
      loginData.form_farm = "'"+loginData.form_farm+"'";
    }
    if((this.searchForm.controls.nombre.value == "")
      && (this.searchForm.controls.codigo_barras.value == 0)
      && (this.searchForm.controls.patologia.value == "")
      && (this.searchForm.controls.laboratorio.value == "")
      && (this.searchForm.controls.efect_second.value == "")
      && (this.searchForm.controls.form_farm.value == "")){
        this.query01 = "a.id_medicament ";
        this.query201 = "";
    }

    this.query = "(SELECT "+this.query00+"FROM medicaments AS A "+this.query201+this.query203+this.query204+this.query205+this.query206+this.queryWhere
    +this.query101+this.query102+this.query103+this.query104+this.query105+this.query106+")";

    console.log("Valor del formulari despres de montar el select");
    console.log(this.query);

    this.apiService.buscarIdMedicamentos(this.query).subscribe((data: any) => {
      console.log(data);

      if(data[0][0] !== 0){
        this.medicamentos = Object.values(data);
      }
      else{
        this.medicamentos = Object.values(data);
        this.medicamentos[0][2] = "No hay medicamentos con este criterio de busqueda";
      }

      this.searchForm.reset();
      this.ngOnInit();

    })
  }
  Consultar(item: any): void {
    console.log(item[0]);
    environment.idMedicament = item[0];
    this.router.navigate(['medicament']);
  }
}
