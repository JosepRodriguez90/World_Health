import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-contactar',
  templateUrl: './contactar.component.html',
  styleUrls: ['./contactar.component.css']
})
export class ContactarComponent implements OnInit {

  constructor(
    private translate: TranslateService
  ) {
    this.translate.addLangs(['es', 'en']);
  }

  ngOnInit(): void {
  }

}
