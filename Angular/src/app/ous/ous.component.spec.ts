import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OusComponent } from './ous.component';

describe('OusComponent', () => {
  let component: OusComponent;
  let fixture: ComponentFixture<OusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OusComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(OusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
