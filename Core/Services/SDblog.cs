using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Interfaces;
using Infrastructure.Models;
using System.Linq.Expressions;
using System.Reflection;
using Infrastructure.Repositories;

namespace Core.Services
{
    public class SDblog<TEntity> : IDblog<TEntity> where TEntity : class, new()
    {
        /*
         * GENERIC CONTROLLER INTERFACE FOR LOGGING FOR ALL EXCEPTIONS, EMAILS, USERS, AND DB LOGGING
         */
        private JOCPaymentTrackingContext _DBContext = new JOCPaymentTrackingContext();
        private DbSet<Dblog> _Dblogs;

        private DbSet<TEntity> _DBSet;
        private bool disposedValue;

        public SDblog()
        {   
            _DBSet = _DBContext.Set<TEntity>();                        
            _Dblogs = _DBContext.Set<Dblog>();
        }

        public async Task<bool> DatabaseLogger(int uid, TEntity TEntityOld, TEntity TEntityNew)
        {
            bool temp = false;
            
            // var t = TEntityOld.Equals(TEntityNew);

            // var tOld = ObjectReflection(TEntityOld);
            // var tNew = ObjectReflection(TEntityNew);

            if ((TEntityOld != null && TEntityNew != null) && (TEntityOld != TEntityNew))
            {
                /*
                 * 8-3-2022 243PM
                 * THIS WORKS AND LOGS INTO DblogS BUT OVER LOGS SINCE IT USE A NESTED LOOP.
                 * 8-4-2022 @ 5pm NO SUCCESS IN COMPARING TO CHECK FOR DATETIME. JUST LET ALL FIELDS LOAD FOR NOW.
                 */                

                PropertyInfo[] propertiesOld = TEntityOld.GetType().GetProperties();
                foreach (PropertyInfo piOld in propertiesOld) 
                {
                    if ((piOld.PropertyType.GetTypeInfo().FullName.ToString().IndexOf("System.DateTime") < 0)//DATETIME TYPE OMITTED FROM LOGGING
                        //&& (piOld.PropertyType.GetTypeInfo().FullName.ToLower().IndexOf("System.DateTime".ToLower()) == -1 != "System.Nullable`1[System.DateTime]".ToLower())
                        && (TEntityOld.GetType().Name.ToLower() != "ExceptionLog".ToLower()) //OMITTED ALL LOGGING TABLES
                        && (TEntityOld.GetType().Name.ToLower() != "EmailLog".ToLower())
                        && (TEntityOld.GetType().Name.ToLower() != "UserLog".ToLower())
                        && (TEntityOld.GetType().Name.ToLower() != "Dblog".ToLower()))
                    {
                        Dblog Dblogs = new Dblog();
                        Dblogs.TableName = TEntityOld.GetType().Name != null ? TEntityOld.GetType().Name : "" ;
                        Dblogs.ColumnName = piOld.Name != null ? piOld.Name : "";
                        Dblogs.ColumnType = piOld.PropertyType.GetTypeInfo().FullName != null ? piOld.PropertyType.GetTypeInfo().FullName : "";
                        Dblogs.ColumnOldValue = piOld.GetValue(TEntityOld) != null ? piOld.GetValue(TEntityOld).ToString() : "";
                        Dblogs.CreatedAt = DateTime.Now;
                        Dblogs.CreatedBy = uid;

                        PropertyInfo[] propertiesNew = TEntityNew.GetType().GetProperties();
                        foreach (PropertyInfo piNew in propertiesNew)
                        {
                            if (TEntityOld.GetType().Name == TEntityNew.GetType().Name && piOld.Name == piNew.Name && piOld.PropertyType.GetTypeInfo().FullName == piNew.PropertyType.GetTypeInfo().FullName)
                            {
                                Dblogs.ColumnNewValue = piNew.GetValue(TEntityNew) != null ? piNew.GetValue(TEntityNew).ToString() : "";
                            }
                        }

                        await _Dblogs.AddAsync(Dblogs);
                    }
                    
                    await _DBContext.SaveChangesAsync();
                }
                

                temp = true;

            }

            return temp;
        }

        protected virtual List<Dblog> ObjectReflection(TEntity TEntity)
        {
            List<Dblog> tempList = new List<Dblog>();   

            PropertyInfo[] propertiesNew = TEntity.GetType().GetProperties();
            foreach (PropertyInfo piTEntity in propertiesNew)
            {
                /*
                 * 8-3-2022 243PM
                 * THIS WORKS AND LOGS INTO DblogS BUT OVER LOGS SINCE IT USE A NESTED LOOP.
                 */


                var temp = piTEntity.GetValue(TEntity) != null ? piTEntity.GetValue(TEntity).ToString() : "";                

                if (
                    (piTEntity.PropertyType.GetTypeInfo().ToString().ToLower() != "system.datetime")//DATETIME TYPE OMITTED FROM LOGGING
                    && (TEntity.GetType().Name.ToLower() != "ExceptionLog".ToLower()) //OMITTED ALL LOGGING TABLES
                    && (TEntity.GetType().Name.ToLower() != "EmailLog".ToLower())
                    && (TEntity.GetType().Name.ToLower() != "UserLog".ToLower())
                    && (TEntity.GetType().Name.ToLower() != "Dblog".ToLower())

                    )
                {

                    if (_DBSet.GetType().Name.ToLower() != "Dblog".ToLower())
                    {
                        Dblog Dblogs = new Dblog();

                        Dblogs.TableName = TEntity.GetType().Name;
                        Dblogs.ColumnName = piTEntity.Name;
                        Dblogs.ColumnType = piTEntity.PropertyType.GetTypeInfo().ToString();
                        Dblogs.ColumnOldValue = temp;
                        Dblogs.ColumnNewValue = temp;
                        Dblogs.CreatedAt = DateTime.Now;
                        Dblogs.CreatedBy = 0;

                        tempList.Add(Dblogs);
                        //await _Dblogs.AddAsync(Dblogs);
                        //await _DBContext.SaveChangesAsync();

                        //temp = true;
                    }
                }
            }

            return tempList;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)                    
                    _DBContext = null;                    
                    _DBSet = null;
                    _Dblogs = null;
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                disposedValue = true;
            }
        }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }
    }
}
