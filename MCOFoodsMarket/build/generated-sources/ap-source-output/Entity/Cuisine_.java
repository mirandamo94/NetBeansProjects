package Entity;

import Entity.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-06T12:35:17")
@StaticMetamodel(Cuisine.class)
public class Cuisine_ { 

    public static volatile CollectionAttribute<Cuisine, Product> productCollection;
    public static volatile SingularAttribute<Cuisine, String> name;
    public static volatile SingularAttribute<Cuisine, Short> id;

}