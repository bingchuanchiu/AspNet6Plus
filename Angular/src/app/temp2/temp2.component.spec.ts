/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { Temp2Component } from './temp2.component';

describe('Temp2Component', () => {
  let component: Temp2Component;
  let fixture: ComponentFixture<Temp2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Temp2Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Temp2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
