; ModuleID = 'Play07B.cpp'
source_filename = "Play07B.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { %struct.Inner, i64, i64, [3 x i32] }
%struct.Inner = type { i64 }

; Function Attrs: mustprogress noinline nounwind uwtable
define dso_local void @_Z3foo1ARS_(%struct.A* noundef byval(%struct.A) align 8 %0, %struct.A* noundef nonnull align 8 dereferenceable(40) %1) #0 {
  %3 = alloca %struct.A*, align 8
  store %struct.A* %1, %struct.A** %3, align 8
  %4 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 1
  store i64 1111, i64* %4, align 8
  %5 = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 2
  store i64 2222, i64* %5, align 8
  %6 = load %struct.A*, %struct.A** %3, align 8
  %7 = getelementptr inbounds %struct.A, %struct.A* %6, i32 0, i32 1
  store i64 3333, i64* %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline norecurse nounwind uwtable
define dso_local noundef i32 @main() #1 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.A, align 8
  %3 = alloca %struct.A, align 8
  store i32 0, i32* %1, align 4
  %4 = bitcast %struct.A* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %4, i8 0, i64 40, i1 false)
  %5 = bitcast i8* %4 to %struct.A*
  %6 = getelementptr inbounds %struct.A, %struct.A* %5, i32 0, i32 0
  %7 = getelementptr inbounds %struct.Inner, %struct.Inner* %6, i32 0, i32 0
  store i64 1111, i64* %7, align 8
  %8 = getelementptr inbounds %struct.A, %struct.A* %5, i32 0, i32 1
  store i64 3333, i64* %8, align 8
  %9 = getelementptr inbounds %struct.A, %struct.A* %5, i32 0, i32 2
  store i64 4444, i64* %9, align 8
  %10 = bitcast %struct.A* %3 to i8*
  %11 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %10, i8* align 8 %11, i64 40, i1 false)
  call void @_Z3foo1ARS_(%struct.A* noundef byval(%struct.A) align 8 %3, %struct.A* noundef nonnull align 8 dereferenceable(40) %2)
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline norecurse nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
