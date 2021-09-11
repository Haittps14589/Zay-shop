package dao;

import java.util.List;

abstract public class abstractSQLDAO<EntityType, KeyType> {
	 abstract public boolean insert(EntityType entity);
	    abstract public boolean update(EntityType entity);
	    abstract public boolean delete(KeyType id);
	    abstract public EntityType selectById(KeyType id);
	    abstract public List<EntityType>selectAll();
}
