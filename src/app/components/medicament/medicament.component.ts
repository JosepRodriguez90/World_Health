import { Component, OnInit } from '@angular/core';
import { UsuariosService } from 'src/app/services/usuarios.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-medicament',
  templateUrl: './medicament.component.html',
  styleUrls: ['./medicament.component.css']
})
export class MedicamentComponent implements OnInit {

  constructor(
    private apiService: UsuariosService,
  ) { }

  medicamentID: any;
  nomMed: any;
  codi: any;
  compo: any;
  comen: any;
  efect: any;
  nomlab: any;
  dirlab: any;
  simp: any;

  ngOnInit(): void {
    this.medicamentID = environment.idMedicament;

    this.apiService.mostrarMedicamento(this.medicamentID).subscribe((data: any) => {
      console.log(data);
      console.log(data.compo)
      this.nomMed = data["nomMed"];
      this.codi = data["codi"];
      this.compo = data["compo"];
      this.comen = data["comen"];
      this.efect = data["efect"];
      this.nomlab = data["nomlab"];
      this.dirlab = data["dirlab"];
      this.simp = data["simp"];
    })

  }

}
