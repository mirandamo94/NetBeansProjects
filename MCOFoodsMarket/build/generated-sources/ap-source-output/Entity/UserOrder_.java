package Entity;

import Entity.OrderedProduct;
import Entity.User;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-05T21:13:15")
@StaticMetamodel(UserOrder.class)
public class UserOrder_ { 

    public static volatile SingularAttribute<UserOrder, BigDecimal> amount;
    public static volatile SingularAttribute<UserOrder, Date> dateCreated;
    public static volatile SingularAttribute<UserOrder, Integer> confirmationNumber;
    public static volatile SingularAttribute<UserOrder, Integer> id;
    public static volatile CollectionAttribute<UserOrder, OrderedProduct> orderedProductCollection;
    public static volatile SingularAttribute<UserOrder, User> userId;

}