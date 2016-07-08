package it.tommaso;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.BookmarkablePageLink;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.markup.repeater.RepeatingView;

/**
 *
 * @author svilupposw
 */
public class MenuPanel extends Panel{
    
    public MenuPanel(String id) {
        super(id);
    
   BookmarkablePageLink home =
           new BookmarkablePageLink("home", HomePage.class);
   BookmarkablePageLink art =
           new BookmarkablePageLink("articoli", ElencoArticoli.class);
   BookmarkablePageLink tariffe =
           new BookmarkablePageLink("tariffe", ElencoTariffe.class);
   BookmarkablePageLink ordini =
           new BookmarkablePageLink("ordini", ElencoOrdini.class);
   add(home);
   add(art);
   add(tariffe);
   add(ordini);
    
   
   }
  
   }
    
