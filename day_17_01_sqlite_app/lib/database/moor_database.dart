import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

// Create tables for app_database_sqlite_file
//@DataClassName('TaskTable or any diffrent name')
class TaskTables extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isDone => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

// (NOTE-1) :
// primary key : every entry must be unique
// auto increament : ( Int id ) row will automatically increament without inserting row

// (NOTE-2) :
// Ommit .call() syntax to just ()
// IntColumn get id => integer().autoIncrement().call();
// IntColumn get id => integer().autoIncrement()();

// (NOTE-3) :
// set more column as (primary key) means (each value inside that column) must be unique (no two values should be same)
// @override
// Set<Column> get myprimarykey => (id, name);

//(NOTE-4) :
// must have following dependencı inside your pubspect.yaml file
// (moor: ^1.4.0)
// (moor_flutter: ^1.4.0)
// (moor_generator: ^2.4.0)
// (build_runner: ^1.7.4)

//(NOTE-5) :
// Terminal command to create/update ()
// flutter packages pub run build_runner watch --delete-conflicting-outputs

// Create sqlite_file
@UseMoor(tables: [TaskTables], daos: [TaskTableDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;
}

//(NOTE-6)
//To separate the queries dealing with TaskTables (and in the future, with comments and habits), we can use data access objects (DAOs). Queries will be moved to a new and cleaner place
//Additionally, we will annotate the TaskTablesDao with @UseDao - we want to tell it which tables it can access. - helps in table_relation

// Denote which tables this_DAO can access
@UseDao(tables: [TaskTables])
class TaskTableDao extends DatabaseAccessor<AppDatabase>
    with _$TaskTableDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  TaskTableDao(this.db) : super(db);

  //(STEP-1) :
  // make sure you add small (t) (first latter small) (of your table)
  Future<List<TaskTable>> getAllTasks() => select(taskTables).get();
  Stream<List<TaskTable>> watchAllTasks() => select(taskTables).watch();
  Future insertTask(Insertable<TaskTable> task) =>
      into(taskTables).insert(task);
  Future updateTask(Insertable<TaskTable> task) =>
      update(taskTables).replace(task);
  Future deleteTask(Insertable<TaskTable> task) =>
      delete(taskTables).delete(task);

  //(STEP-2) :
  //Advance moor sqlite quaries
  Stream<List<TaskTable>> watchAllTasksWithoutOrder() =>
      select(taskTables).watch();
  Stream<List<TaskTable>> watchAllTasksWithOrder() {
    return (select(taskTables)
          ..orderBy([
            // Primary sorting by due date
            (taskTemp) => OrderingTerm(
                expression: taskTemp.dueDate, mode: OrderingMode.desc),
            // Secondary alphabetical sorting
            (taskTemp) => OrderingTerm(expression: taskTemp.name),
          ]))
        .watch();
  }
}
