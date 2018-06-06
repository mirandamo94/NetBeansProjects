package Entity;

import Entity.UserOrder;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-06T16:01:09")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> address;
    public static volatile SingularAttribute<User, String> phone;
    public static volatile SingularAttribute<User, String> creditCardNum;
    public static volatile SingularAttribute<User, String> name;
    public static volatile SingularAttribute<User, String> location;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> email;
    public static volatile CollectionAttribute<User, UserOrder> userOrderCollection;

}