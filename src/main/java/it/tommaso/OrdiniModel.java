/*
 * Copyright 2016 svilupposw.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package it.tommaso;



import it.tommaso.beans.Ordini;
import javax.persistence.EntityManager;
import org.apache.wicket.model.LoadableDetachableModel;

/**
 *
 * @author svilupposw
 */
public class OrdiniModel extends LoadableDetachableModel<Ordini>{

    private int id;
    
    public OrdiniModel(int id){
    
    this.id = id;
        
    }
    
    @Override
    protected Ordini load() {
        
        //Carica un cliente dal db
        EntityManager em = PM.getEM();
        try
        {
        
            Ordini c = em.find(Ordini.class, id);
            return c;
        
        }
        finally
        
        {    
            em.close();
        
        }
        
        
    }

    
}