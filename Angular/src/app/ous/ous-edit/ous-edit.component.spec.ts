import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OusEditComponent } from './ous-edit.component';

describe('OusEditComponent', () => {
  let component: OusEditComponent;
  let fixture: ComponentFixture<OusEditComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OusEditComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(OusEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
