import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router, Params, ActivatedRoute } from '@angular/router';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import Swal from 'sweetalert2';
import { AdminService } from '../../../services/admin.service';
import { Medica } from 'src/app/model/Medica';
import { updateMedica } from 'src/app/model/updateMedica';
import { consultarmedicament } from 'src/app/model/consultarmedicament';


@Component({
  selector: 'app-modificarmedica',
  templateUrl: './modificarmedica.component.html',
  styleUrls: ['./modificarmedica.component.css']
})
export class ModificarmedicaComponent implements OnInit {

  constructor(private formBuilder: FormBuilder,
    private AdminService: AdminService,
    private router: Router,
    private routes: ActivatedRoute) { }

    addForm: FormGroup;
    token: any;
    submitted = false;
    usuarioExiste;
    medicamentosup;


    idmedicament: string;
    medicamentos;
    medica;

    ngOnInit(): void {

      this.addForm = this.formBuilder.group({
        id: [],
        Nombre: ['', Validators.required],
        composicion: ['', Validators.required],
        codigo: ['', Validators.required],
        comentarios: ['', Validators.required]
      });
      this.AdminService.updateMedica;


      this.idmedicament = localStorage.getItem('idmedicament')
      this.medica = new consultarmedicament(this.idmedicament)
      console.log(this.medica)
      this.AdminService.idmostrarmedica(this.medica)
      .subscribe (
        datos => {
          console.log(datos)
          this.medicamentos = Object.values(datos)
          console.log(this.medicamentos);
        })
    }

    get f() {
      return this.addForm.controls;
    }


    onSubmit() {
      this.submitted = true;
      console.log(this.addForm.value);

      if (this.addForm.invalid) {
        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: 'Los datos no son correctos.',
        })
        return;
      }
      else {

        this.AdminService.updateMedica(this.addForm.value).subscribe(
          (data) => {
            console.log(data);


              Swal.fire({
                icon: 'success',
                title: 'S´ha registrat correctament',
                showConfirmButton: false,
                timer: 1500
              }).then((result) => {
                this.router.navigate(['medicamientosComponent']);
              });


          }
        );
      }
    }
}
