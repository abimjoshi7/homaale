import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../samples/task_entity_service_res_sample.dart';

class MockTaskEntityServiceRepository extends Mock
    implements TaskEntityServiceRepository {}

class MockTaskEntityServiceBloc extends TaskEntityServiceBloc {
  MockTaskEntityServiceBloc(super.repo);
}

void main() {
  late final MockTaskEntityServiceRepository repository;
  late final TaskEntityServiceBloc tesBloc;

  setUp(
    () {
      repository = MockTaskEntityServiceRepository();
      tesBloc = TaskEntityServiceBloc(
        repository,
      );
    },
  );

  blocTest<TaskEntityServiceBloc, TaskEntityServiceState>(
    'emits [MyState] when MyEvent is added.',
    build: () => tesBloc,
    act: (bloc) => bloc.add(
      TaskEntityServiceInitiated(),
    ),
    expect: () => const <TaskEntityServiceState>[
      TaskEntityServiceState(
        theStates: TheStates.success,
      ),
    ],
  );
  test(
    "Fetch TES services",
    () async {
      when(
        () => repository.getTaskEntityServices(),
      ).thenAnswer(
        (invocation) async => TaskEntityServiceModel.fromJson(
          kTesRes,
        ),
      );
    },
  );
  group(
    "Task Entity Service Bloc",
    () {
      group(
        "repo",
        () {},
      );
      // test(
      //   "Initial State Check",
      //   () => expect(
      //     tesBloc.state.theStates,
      //     TheStates.initial,
      //   ),
      // );

      // blocTest(
      //   "Single TES Load Test",
      //   build: () => tesBloc,
      //   act: (bloc) => bloc.add(
      //     TaskEntityServiceSingleLoaded(id: "id"),
      //   ),
      //   expect: () => const <TaskEntityServiceState>[
      //     TaskEntityServiceState.initial(),
      //     TaskEntityServiceState.initial(
      //       theStates: TheStates.failure,
      //     ),
      //   ],
      // );
    },
  );
}
