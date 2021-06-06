import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ApiResponse } from '../../../model/api-response';
import { environment } from 'src/environments/environment';
import { Router } from '@angular/router';
import { AdminService } from '../../../services/admin.service';
import { consultarmedicament } from '../../../model/consultarmedicament';
import { Medica } from 'src/app/model/Medica';
import { FormGroup } from '@angular/forms';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-medicamientos',
  templateUrl: './medicamientos.component.html',
  styleUrls: ['./medicamientos.component.css']
})
export class MedicamientosComponent implements OnInit {
  idmedicament: string;
  medicamentos;
  medica;

  constructor(
    public translate: TranslateService,
    private AdminService: AdminService,
    private router: Router,
    ) {  this.translate.addLangs(['es', 'en']), this.translate.setDefaultLang('es'); }

  ngOnInit(): void {
    this.idmedicament = localStorage.getItem('idmedicament')
    this.medica = new consultarmedicament(this.idmedicament)
    console.log(this.medica)
    this.AdminService.adminmedicaments(this.medica)
    .subscribe (
      datos => {
        console.log(datos)
        this.medicamentos = Object.values(datos)
        console.log(this.medicamentos);
      })
  }


  eliminar(item){

    console.log(item[0])
    this.AdminService.eliminarMedicamiento(item[0]).subscribe (
      datos => {

        console.log(datos)
        location.reload();
      })

  }

  crear(){
    this.router.navigate(['crearmedicaComponent',]);
  }

  modificar(item){
    console.log(item[0]);

    this.AdminService.createMedicaupdate(item[0]).subscribe(
      (data) => {
        console.log(data);
        console.log(item);
    this.router.navigate(['modificarmedicaComponent',item]);
  });

}

}

