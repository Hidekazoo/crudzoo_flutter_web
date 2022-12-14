// Mocks generated by Mockito 5.3.2 from annotations
// in crudzoo_flutter_web/test/usecase/tasks_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:crudzoo_flutter_web/domain/task.dart' as _i2;
import 'package:crudzoo_flutter_web/usecase/tasks_input_port.dart' as _i3;
import 'package:crudzoo_flutter_web/usecase/tasks_output_port.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTaskContent_0 extends _i1.SmartFake implements _i2.TaskContent {
  _FakeTaskContent_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTask_1 extends _i1.SmartFake implements _i2.Task {
  _FakeTask_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Task].
///
/// See the documentation for Mockito's code generation for more information.
class MockTask extends _i1.Mock implements _i2.Task {
  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i2.TaskContent get taskContent => (super.noSuchMethod(
        Invocation.getter(#taskContent),
        returnValue: _FakeTaskContent_0(
          this,
          Invocation.getter(#taskContent),
        ),
        returnValueForMissingStub: _FakeTaskContent_0(
          this,
          Invocation.getter(#taskContent),
        ),
      ) as _i2.TaskContent);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
        returnValueForMissingStub: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [TasksInputPort].
///
/// See the documentation for Mockito's code generation for more information.
class MockTasksInputPort extends _i1.Mock implements _i3.TasksInputPort {
  @override
  _i4.Future<List<_i2.Task>> findTasks() => (super.noSuchMethod(
        Invocation.method(
          #findTasks,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Task>>.value(<_i2.Task>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Task>>.value(<_i2.Task>[]),
      ) as _i4.Future<List<_i2.Task>>);
  @override
  _i4.Future<_i2.Task> createTask(_i2.TaskContent? content) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTask,
          [content],
        ),
        returnValue: _i4.Future<_i2.Task>.value(_FakeTask_1(
          this,
          Invocation.method(
            #createTask,
            [content],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Task>.value(_FakeTask_1(
          this,
          Invocation.method(
            #createTask,
            [content],
          ),
        )),
      ) as _i4.Future<_i2.Task>);
}

/// A class which mocks [TasksOutputPort].
///
/// See the documentation for Mockito's code generation for more information.
class MockTasksOutputPort extends _i1.Mock implements _i5.TasksOutputPort {
  @override
  void setTasks(List<_i2.Task>? tasks) => super.noSuchMethod(
        Invocation.method(
          #setTasks,
          [tasks],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TaskContent].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskContent extends _i1.Mock implements _i2.TaskContent {
  @override
  String get subject => (super.noSuchMethod(
        Invocation.getter(#subject),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get link => (super.noSuchMethod(
        Invocation.getter(#link),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get body => (super.noSuchMethod(
        Invocation.getter(#body),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);
}
