import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/task_entity_service/data/repositories/task_entity_services_repository.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskEntityServiceRepository extends Mock
    implements TaskEntityServiceRepository {}

void main() {
  final _repo = MockTaskEntityServiceRepository();
  final _bloc = TaskEntityServiceBloc(
    _repo,
  );
  group(
    "Task Entity Service Bloc",
    () {
      group(
        "repo",
        () {
          test(
            "Fetch TES services",
            () async {
              when(
                () => _repo.getTaskEntityServices(),
              ).thenAnswer(
                (invocation) async => TaskEntityServiceModel(
                  count: 100,
                  result: [
                    TaskEntityService(),
                  ],
                ),
              );
              verifyNoMoreInteractions(_repo);
            },
          );
        },
      );
      test(
        "Initial State Check",
        () => expect(
          _bloc.state.theStates,
          TheStates.initial,
        ),
      );

      blocTest<TaskEntityServiceBloc, TaskEntityServiceState>(
        'emits [MyState] when MyEvent is added.',
        build: () => _bloc,
        act: (bloc) => bloc.add(TaskEntityServiceInitiated()),
        expect: () => const <TaskEntityServiceState>[
          TaskEntityServiceState(
            theStates: TheStates.failure,
          ),
        ],
      );

      blocTest(
        "Single TES Load Test",
        build: () => _bloc,
        act: (bloc) => bloc.add(
          TaskEntityServiceSingleLoaded(id: "id"),
        ),
        expect: () => const <TaskEntityServiceState>[
          TaskEntityServiceState.initial(),
          TaskEntityServiceState.initial(
            theStates: TheStates.failure,
          ),
        ],
      );
    },
  );
}
