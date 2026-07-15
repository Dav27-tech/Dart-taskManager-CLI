abstract class Repository<T> {
  void add(T item);

  void remove(int id);

  T? findById(int id);

  List<T> findAll();
}
