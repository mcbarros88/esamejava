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
import it.tommaso.beans.TariffeCorriere;
import java.util.ArrayList;
import org.apache.wicket.extensions.markup.html.repeater.data.grid.ICellPopulator;
import org.apache.wicket.extensions.markup.html.repeater.data.table.AbstractColumn;
import org.apache.wicket.extensions.markup.html.repeater.data.table.DefaultDataTable;
import org.apache.wicket.extensions.markup.html.repeater.data.table.IColumn;
import org.apache.wicket.extensions.markup.html.repeater.data.table.PropertyColumn;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

/**
 *
 * @author svilupposw
 */
public class ElencoOrdini extends WebPage
{
    public ElencoOrdini(){

    ArrayList<IColumn<Ordini, String>> colonne
            = new ArrayList<IColumn<Ordini, String>>();
    
    
   
    colonne.add(new PropertyColumn<Ordini, String> 
            (Model.of("Numero"), "numero"));
    
    colonne.add(new PropertyColumn<Ordini, String> 
            (Model.of("Data"), "data"));
    
    colonne.add(new AbstractColumn<Ordini, String>
            (Model.of("Tariffa migliore")) {
                
        @Override
        public void populateItem(Item<ICellPopulator<Ordini>> item, String wicketId, IModel<Ordini> imodel) {
            
            Ordini o = imodel.getObject();
            TariffeCorriere o2 = TariffeCorriereDAO.calcolaTariffaMigliore(o);
            double cazzo = o2.getCosto();
            String cazzo2= o2.getNomeCorriere();
            String cazzo3= o2.getNomeTariffa();
            Label l = new Label(wicketId, "€"+cazzo+" "+"("+cazzo2+" "+cazzo3+")");
            
            item.add(l);
        }
        });
    
    
    
 
    add(new DefaultDataTable<Ordini, String>("ordini", colonne, new OrdiniDataProvider(),11));
    
    
    }
}
