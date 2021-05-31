import { Component, OnInit } from '@angular/core';
import { ApiResponse } from '../../../model/api-response';
import { environment } from 'src/environments/environment';
import { Router } from '@angular/router';
import { AdminService } from '../../../services/admin.service';
import { consultarmedicament } from '../../../model/consultarmedicament';

@Component({
  selector: 'app-medicamientos',
  templateUrl: './medicamientos.component.html',
  styleUrls: ['./medicamientos.component.css']
})
export class MedicamientosComponent implements OnInit {
  idmedicament: string;
  medicamentos;
  medica;

  constructor( private AdminService: AdminService,
    ) { }

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

}