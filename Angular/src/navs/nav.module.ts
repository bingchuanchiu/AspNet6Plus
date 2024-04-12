import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavComponent } from './nav.component';

import { NavPrimaryComponent } from './nav-primary/nav-primary.component';
import { NavSecondaryComponent } from './nav-secondary/nav-secondary.component';

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [NavComponent, NavPrimaryComponent, NavSecondaryComponent]
})
export class NavModule { }
