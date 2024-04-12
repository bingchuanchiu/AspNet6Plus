import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExceptionLogsComponent } from './exception-logs.component';

describe('ExceptionLogsComponent', () => {
  let component: ExceptionLogsComponent;
  let fixture: ComponentFixture<ExceptionLogsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExceptionLogsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ExceptionLogsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
