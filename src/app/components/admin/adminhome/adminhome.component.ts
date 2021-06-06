import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-adminhome',
  templateUrl: './adminhome.component.html',
  styleUrls: ['./adminhome.component.css']
})
export class AdminhomeComponent implements OnInit {

  constructor(public translate: TranslateService) {
    this.translate.addLangs(['es', 'en']), this.translate.setDefaultLang('es');
   }

  ngOnInit(): void {
  }

}
