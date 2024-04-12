import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DBLogsComponent } from './db-logs.component';

describe('DBLogsComponent', () => {
  let component: DBLogsComponent;
  let fixture: ComponentFixture<DBLogsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DBLogsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DBLogsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
