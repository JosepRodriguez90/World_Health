import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {

  constructor(public translate: TranslateService ) {
    this.translate.addLangs(['es', 'en']);
        this.translate.setDefaultLang('es');
  }

  ngOnInit(): void {
  }

}
